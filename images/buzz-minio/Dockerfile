# MinIO and mc for the chart's quickstart object store (minio.enabled): the
# MinIO Deployment, the bucket init Job and the relay's wait-for-bucket init
# container. Built for linux/amd64 and linux/arm64 by the
# push-buzz-minio-to-registries CircleCI job (.circleci/custom.yml) and tagged
# with the chart version. The binaries are MinIO's checksummed official
# releases, the versions upstream's ghcr.io/block/buzz-minio carries.
FROM gsoci.azurecr.io/giantswarm/alpine:3.24.2

ARG TARGETARCH
ARG MINIO_RELEASE=RELEASE.2025-09-07T16-13-09Z
ARG MC_RELEASE=RELEASE.2025-08-13T08-35-41Z

LABEL org.opencontainers.image.title="buzz-minio" \
      org.opencontainers.image.description="MinIO and mc for the Buzz chart's quickstart profile" \
      org.opencontainers.image.licenses="AGPL-3.0-only"

RUN apk add --no-cache ca-certificates curl

# sha256 of each release binary, per architecture.
RUN set -eu; \
    case "${TARGETARCH}" in \
      amd64) minio_sha=7c5bd8512c6e966455b1d198209358b2d191c77a83ab377c4073281065fb855f; \
             mc_sha=01f866e9c5f9b87c2b09116fa5d7c06695b106242d829a8bb32990c00312e891 ;; \
      arm64) minio_sha=5c83cd2cf151717ba0243f73e1c7802ff36e272b67144bdd7f1f7d684fd6f03d; \
             mc_sha=14c8c9616cfce4636add161304353244e8de383b2e2752c0e9dad01d4c27c12c ;; \
      *) echo "unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSLo /usr/local/bin/minio "https://github.com/minio/minio/releases/download/${MINIO_RELEASE}/minio.linux-${TARGETARCH}.${MINIO_RELEASE}"; \
    curl -fsSLo /usr/local/bin/mc "https://github.com/minio/mc/releases/download/${MC_RELEASE}/mc.linux-${TARGETARCH}.${MC_RELEASE}"; \
    printf '%s  %s\n' "${minio_sha}" /usr/local/bin/minio "${mc_sha}" /usr/local/bin/mc | sha256sum -c -; \
    chmod 0755 /usr/local/bin/minio /usr/local/bin/mc

ENTRYPOINT ["minio"]
