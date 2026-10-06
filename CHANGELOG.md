# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- added: `s3.existingSecret` (`name`, `key`) sources the relay's `BUZZ_S3_SECRET_KEY` from an existing Secret and keeps it out of the chart-managed one; carried on upstream's templates as `patches/0001-chart-s3-existing-secret.patch`.
- added: the buzz chart, upstream's chart of [block/buzz](https://github.com/block/buzz) at `relay-v0.2.1` (relay 0.2.1) vendored with vendir, its images and the bundled Postgres, Redis and MinIO images pulled from `gsoci.azurecr.io`.

[Unreleased]: https://github.com/giantswarm/buzz/tree/main
