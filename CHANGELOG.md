# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- changed: a branch build no longer pushes a dev `buzz-minio` image: `build-buzz-minio` builds it for both platforms without pushing, and `push-buzz-minio-to-registries` runs on release tags only.
- removed: the deprecated `replace-chart-version-with-git` key from `.abs/main.yaml`.
- changed: `make helm-test` no longer runs `helm/buzz/tests` twice: the hand-written target beside the generated one in `Makefile.gen.app.mk` (giantswarm/devctl#2570) is gone, so the helm-unittest version is pinned in one place. `make helm-lint` still runs as part of it, and so do the suites the vendored subcharts ship, as before.
- fixed: an upgrade that enables the bundled MinIO no longer fails on the bucket init hook: the Job is a `pre-upgrade` hook only when the release's MinIO Deployment already exists, otherwise the normal revision-named Job that runs alongside MinIO; in `patches/0003-chart-minio-init-upgrade-hook.patch`.
- fixed: the MinIO bucket init Job no longer piles up across failed upgrades: on upgrade it is a `pre-upgrade` hook with a stable name that replaces a failed attempt's Job and is removed once it succeeds, and `activeDeadlineSeconds: 300` ends one whose image cannot be pulled; on install it stays a normal resource, so `helm install --wait` does not deadlock; carried on upstream's templates as `patches/0003-chart-minio-init-upgrade-hook.patch`.
- fixed: the default `minio.image` and `minio.mcImage` tag drops the chart version's build metadata, which Flux's `OCIRepository` appends (`0.3.2+<digest>`) and an image reference does not allow; under Flux the bundled MinIO no longer fails with `InvalidImageName`.
- changed: `minio.image` and `minio.mcImage` default to `minio.repository` at the chart's own version, the buzz-minio build every release pushes, instead of a pinned tag; carried on upstream's templates as `patches/0002-chart-minio-image-default.patch`.
- fixed: the buzz-minio image is no longer pushed from `main` or a release branch, whose head after a release is the tagged commit; the `main` build after a release no longer fails.
- added: `s3.existingSecret` (`name`, `key`) sources the relay's `BUZZ_S3_SECRET_KEY` from an existing Secret and keeps it out of the chart-managed one; carried on upstream's templates as `patches/0001-chart-s3-existing-secret.patch`.
- added: the buzz chart, upstream's chart of [block/buzz](https://github.com/block/buzz) at `relay-v0.2.1` (relay 0.2.1) vendored with vendir, its images and the bundled Postgres, Redis and MinIO images pulled from `gsoci.azurecr.io`.

[Unreleased]: https://github.com/giantswarm/buzz/tree/main
