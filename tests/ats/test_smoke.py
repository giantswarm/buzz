"""ATS smoke for the buzz chart.

app-test-suite (ATS >= 1.0) installs the packaged chart on the job's kind
cluster with `helm upgrade --install --wait` and the quickstart values
(helm/buzz/ci/quickstart-values.yaml, named in .ats/main.yaml), then runs
this file with `pytest -m smoke`. The relay is Ready only once it reaches Postgres, Redis
and the MinIO bucket (its readiness probe), so a Ready relay proves the
chart wires the bundled services and the gsoci images pull. The
dependencies are the generated tests/ats/pyproject.toml, owned by
giantswarm/devctl; this file and .ats/main.yaml are the repository's own.
"""

import pykube
import pytest
from pytest_helm_charts.clusters import Cluster
from pytest_helm_charts.k8s.deployment import wait_for_deployments_to_run

NAMESPACE = "default"
TIMEOUT_SECONDS = 600


@pytest.mark.smoke
def test_api_working(kube_cluster: Cluster) -> None:
    """The kind cluster ATS runs against is reachable."""
    assert kube_cluster.kube_client is not None
    assert len(pykube.Node.objects(kube_cluster.kube_client)) >= 1


@pytest.mark.smoke
def test_buzz_deployments_ready(kube_cluster: Cluster) -> None:
    """The relay and the bundled MinIO run Ready."""
    names = [
        d.name
        for d in pykube.Deployment.objects(kube_cluster.kube_client)
        .filter(namespace=NAMESPACE, selector={"app.kubernetes.io/part-of": "buzz"})
    ]
    assert names, "the chart created no Deployment"
    wait_for_deployments_to_run(kube_cluster.kube_client, names, NAMESPACE, TIMEOUT_SECONDS)
