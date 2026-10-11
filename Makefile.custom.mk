##@ Chart

HELM_UNITTEST_VERSION := 1.0.3

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

.PHONY: helm-test
helm-test: helm-lint helm-unittest ## Run every chart check (what the chart-test CI job runs).

.PHONY: helm-lint
helm-lint: ## Lint the chart with the quickstart values.
	helm lint helm/buzz -f helm/buzz/ci/quickstart-values.yaml

.PHONY: helm-unittest
helm-unittest: helm-plugin-unittest ## Run the helm-unittest suites in helm/buzz/tests/ (not the vendored subcharts').
	helm unittest --with-subchart=false helm/buzz

.PHONY: helm-plugin-unittest
helm-plugin-unittest:
	@helm plugin list | grep -q '^unittest' || helm plugin install https://github.com/helm-unittest/helm-unittest --version $(HELM_UNITTEST_VERSION)
