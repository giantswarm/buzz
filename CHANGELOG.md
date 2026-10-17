# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.4-rc.2] - 2026-10-12

- fixed: an upgrade that enables the bundled MinIO no longer fails on the bucket init hook: the Job is a `pre-upgrade` hook only when the release's MinIO Deployment already exists, otherwise the normal revision-named Job that runs alongside MinIO; in `patches/0003-chart-minio-init-upgrade-hook.patch`.

## [0.3.4-rc.1] - 2026-10-12

- fixed: the MinIO bucket init Job no longer piles up across failed upgrades: on upgrade it is a `pre-upgrade` hook with a stable name that replaces a failed attempt's Job and is removed once it succeeds, and `activeDeadlineSeconds: 300` ends one whose image cannot be pulled; on install it stays a normal resource, so `helm install --wait` does not deadlock; carried on upstream's templates as `patches/0003-chart-minio-init-upgrade-hook.patch`.

## [0.3.3] - 2026-10-11

- fixed: the default `minio.image` and `minio.mcImage` tag drops the chart version's build metadata, which Flux's `OCIRepository` appends (`0.3.2+<digest>`) and an image reference does not allow; under Flux the bundled MinIO no longer fails with `InvalidImageName`.

## [0.3.2] - 2026-10-11

- changed: `minio.image` and `minio.mcImage` default to `minio.repository` at the chart's own version, the buzz-minio build every release pushes, instead of a pinned tag; carried on upstream's templates as `patches/0002-chart-minio-image-default.patch`.
- fixed: the buzz-minio image is no longer pushed from `main` or a release branch, whose head after a release is the tagged commit; the `main` build after a release no longer fails.

## [0.2.0] - 2026-10-06

- added: `s3.existingSecret` (`name`, `key`) sources the relay's `BUZZ_S3_SECRET_KEY` from an existing Secret and keeps it out of the chart-managed one; carried on upstream's templates as `patches/0001-chart-s3-existing-secret.patch`.

## [0.1.0] - 2026-10-05

- added: the buzz chart, upstream's chart of [block/buzz](https://github.com/block/buzz) at `relay-v0.2.1` (relay 0.2.1) vendored with vendir, its images and the bundled Postgres, Redis and MinIO images pulled from `gsoci.azurecr.io`.

[Unreleased]: https://github.com/giantswarm/buzz/compare/v0.3.4-rc.2...HEAD
[0.3.4-rc.2]: https://github.com/giantswarm/buzz/compare/v0.3.4-rc.1...v0.3.4-rc.2
[0.3.4-rc.1]: https://github.com/giantswarm/buzz/compare/v0.3.3...v0.3.4-rc.1
[0.3.3]: https://github.com/giantswarm/buzz/compare/v0.3.2...v0.3.3
[0.3.2]: https://github.com/giantswarm/buzz/compare/v0.2.0...v0.3.2
[0.2.0]: https://github.com/giantswarm/buzz/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/buzz/releases/tag/v0.1.0
