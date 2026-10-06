##@ Chart

HELM_UNITTEST_VERSION := 1.0.3

.PHONY: sync-chart
sync-chart: ## Vendor upstream's chart at the vendir.yml ref and re-apply patches/*.patch to it.
	vendir sync
	@for p in patches/*.patch; do echo "applying $$p"; git apply "$$p" || exit 1; done

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
