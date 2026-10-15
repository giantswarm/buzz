##@ Chart

.PHONY: sync-chart
sync-chart: ## Vendor everything in vendir.yml, re-apply patches/*.patch and bring Chart.yaml, Chart.lock and charts/*.tgz in line.
	vendir sync
	@for p in patches/*.patch; do echo "applying $$p"; git apply "$$p" || exit 1; done
	@# Each file:// dependency in Chart.yaml takes its vendored chart's version
	@# (a sed range per entry: yq would reformat the whole file).
	@for c in helm/buzz/charts/*/Chart.yaml; do \
		name=$$(sed -n 's/^name: *//p' "$$c"); version=$$(sed -n 's/^version: *//p' "$$c"); \
		sed -i "/^- name: $$name\$$/,/^  repository:/ s/^  version: .*/  version: $$version/" helm/buzz/Chart.yaml; \
	done
	cd helm/buzz && helm dependency update --skip-refresh
	@# helm re-packs a vendored chart with fresh timestamps: a tgz whose version
	@# did not change keeps its committed bytes, so a second sync is a no-op.
	@git diff --name-only -- 'helm/buzz/charts/*.tgz' | xargs -r git checkout --

# Prerequisite-only, no recipe: make merges it into the generated helm-test
# rule, which keeps its recipe and gains the lint. That recipe runs every
# suite under helm/, the vendored subcharts' own suites included.
.PHONY: helm-test
helm-test: helm-lint

.PHONY: helm-lint
helm-lint: ## Lint the chart with the quickstart values.
	helm lint helm/buzz -f helm/buzz/ci/quickstart-values.yaml
