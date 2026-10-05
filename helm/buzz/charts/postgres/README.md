# postgres

![Version: 0.19.5](https://img.shields.io/badge/Version-0.19.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 18.4.0](https://img.shields.io/badge/AppVersion-18.4.0-informational?style=flat-square)

The World's Most Advanced Open Source Relational Database

**Homepage:** <https://www.postgresql.org>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| CloudPirates GmbH & Co. KG | <hello@cloudpirates.io> | <https://www.cloudpirates.io> |

## Source Code

* <https://github.com/CloudPirates-io/helm-charts/tree/main/charts/postgres>
* <https://github.com/postgres/postgres>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/cloudpirates | common | 2.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imageRegistry | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| global.enableServiceLinks | bool | `true` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| commonLabels | object | `{}` |  |
| commonAnnotations | object | `{}` |  |
| priorityClassName | string | `""` |  |
| terminationGracePeriodSeconds | int | `30` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"postgres"` |  |
| image.tag | string | `"18.4@sha256:8ff36f3c66371cba71d20ceedccfc3de9669a68737607888c4ef0af93abe8e39"` |  |
| image.imagePullPolicy | string | `"Always"` |  |
| image.useHardenedImage | bool | `false` |  |
| replicaCount | int | `1` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `999` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.runAsNonRoot | bool | `true` |  |
| containerSecurityContext.runAsUser | int | `999` |  |
| containerSecurityContext.runAsGroup | int | `999` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `false` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| auth.username | string | `""` |  |
| auth.password | string | `""` |  |
| auth.database | string | `""` |  |
| auth.existingSecret | string | `""` |  |
| auth.secretKeys.adminPasswordKey | string | `"postgres-password"` |  |
| config.mountConfigMap | bool | `true` |  |
| config.postgresqlSharedPreloadLibraries | string | `""` |  |
| config.postgresqlMaxConnections | int | `0` |  |
| config.postgresqlSharedBuffers | string | `""` |  |
| config.postgresqlEffectiveCacheSize | string | `""` |  |
| config.postgresqlWorkMem | string | `""` |  |
| config.postgresqlMaintenanceWorkMem | string | `""` |  |
| config.postgresqlWalBuffers | string | `""` |  |
| config.postgresqlCheckpointCompletionTarget | string | `""` |  |
| config.postgresqlRandomPageCost | string | `""` |  |
| config.postgresqlLogStatement | string | `""` |  |
| config.postgresqlLogMinDurationStatement | string | `""` |  |
| config.extraConfig | list | `[]` |  |
| config.existingConfigmap | string | `""` |  |
| config.pgHbaConfig | string | `""` |  |
| config.postgresql.max_connections | int | `100` |  |
| config.postgresql.shared_buffers | string | `"128MB"` |  |
| config.postgresql.effective_cache_size | string | `"4GB"` |  |
| config.postgresql.work_mem | string | `"4MB"` |  |
| config.postgresql.maintenance_work_mem | string | `"64MB"` |  |
| config.postgresql.checkpoint_completion_target | float | `0.7` |  |
| config.postgresql.random_page_cost | float | `1.1` |  |
| config.postgresql.timezone | string | `"UTC"` |  |
| config.postgresql.locale | string | `"en_US.utf8"` |  |
| config.postgresql.default_text_search_config | string | `"pg_catalog.english"` |  |
| config.postgresql.datestyle | string | `"iso, mdy"` |  |
| config.postgresql.log_destination | string | `"stderr"` |  |
| config.postgresql.logging_collector | string | `"off"` |  |
| config.postgresql.log_min_messages | string | `"warning"` |  |
| config.postgresql.log_min_error_statement | string | `"error"` |  |
| config.postgresql.log_statement | string | `"none"` |  |
| config.postgresql.log_min_duration_statement | int | `-1` |  |
| config.postgresql.shared_preload_libraries | string | `""` |  |
| config.postgresql.wal_buffers | string | `"16MB"` |  |
| config.postgresql.wal_level | string | `"replica"` |  |
| config.postgresql.max_wal_senders | int | `10` |  |
| config.postgresql.wal_keep_size | int | `1024` |  |
| customUser.name | string | `""` |  |
| customUser.database | string | `""` |  |
| customUser.password | string | `""` |  |
| customUser.existingSecret | string | `""` |  |
| customUser.secretKeys.name | string | `"CUSTOM_USER"` |  |
| customUser.secretKeys.database | string | `"CUSTOM_DB"` |  |
| customUser.secretKeys.password | string | `"CUSTOM_PASSWORD"` |  |
| initdb.args | string | `""` |  |
| initdb.scripts | object | `{}` |  |
| initdb.scriptsConfigMap | string | `""` |  |
| initdb.directory | string | `"/docker-entrypoint-initdb.d/"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `5432` |  |
| service.targetPort | int | `5432` |  |
| service.nodePort | int | `30432` |  |
| service.annotations | object | `{}` |  |
| service.loadBalancerIP | string | `""` |  |
| service.externalTrafficPolicy | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"postgres.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| gatewayAPI.httpRoute.enabled | bool | `false` |  |
| gatewayAPI.httpRoute.annotations | object | `{}` |  |
| gatewayAPI.httpRoute.parentRefs[0].name | string | `"gateway"` |  |
| gatewayAPI.httpRoute.parentRefs[0].namespace | string | `""` |  |
| gatewayAPI.httpRoute.parentRefs[0].sectionName | string | `""` |  |
| gatewayAPI.httpRoute.hostnames[0] | string | `"postgres.local"` |  |
| gatewayAPI.httpRoute.rules[0].matches[0].path.type | string | `"PathPrefix"` |  |
| gatewayAPI.httpRoute.rules[0].matches[0].path.value | string | `"/"` |  |
| resources | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.storageClass | string | `""` |  |
| persistence.annotations | object | `{}` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.subPath | string | `""` |  |
| persistence.labels | object | `{}` |  |
| persistence.volumeName | string | `"data"` |  |
| persistentVolumeClaimRetentionPolicy.enabled | bool | `false` |  |
| persistentVolumeClaimRetentionPolicy.whenScaled | string | `"Retain"` |  |
| persistentVolumeClaimRetentionPolicy.whenDeleted | string | `"Retain"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.successThreshold | int | `1` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `5` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.successThreshold | int | `1` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.initialDelaySeconds | int | `30` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.successThreshold | int | `1` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| extraEnvVars | list | `[]` |  |
| extraEnvVarsSecret | string | `""` |  |
| extraVolumes | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| initContainers | list | `[]` |  |
| command | list | `[]` |  |
| args | string | `nil` |  |
| extraObjects | list | `[]` |  |
| metrics.enabled | bool | `false` |  |
| metrics.image.registry | string | `"quay.io"` |  |
| metrics.image.repository | string | `"prometheuscommunity/postgres-exporter"` |  |
| metrics.image.tag | string | `"v0.19.1@sha256:e96064f876226d94bb6ce48a4c4b3dd76edba91168ec1ab024e5c4b959310b0f"` |  |
| metrics.image.pullPolicy | string | `"Always"` |  |
| metrics.resources | object | `{}` |  |
| metrics.service.annotations | object | `{}` |  |
| metrics.service.labels | object | `{}` |  |
| metrics.service.port | int | `9187` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.namespace | string | `""` |  |
| metrics.serviceMonitor.interval | string | `"30s"` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| metrics.serviceMonitor.selector | object | `{}` |  |
| metrics.serviceMonitor.annotations | object | `{}` |  |
| metrics.serviceMonitor.honorLabels | bool | `false` |  |
| metrics.serviceMonitor.relabelings | list | `[]` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.namespaceSelector | object | `{}` |  |
| replication.enabled | bool | `false` |  |
| replication.primary.host | string | `""` |  |
| replication.primary.port | int | `5432` |  |
| replication.createUser | bool | `true` | Whether to create the replication user |
| replication.auth.username | string | `"replication"` |  |
| replication.auth.password | string | `""` |  |
| replication.auth.existingSecret | string | `""` |  |
| replication.auth.secretKeys.password | string | `"replication-password"` |  |
| replication.allowFrom.ipv4 | string | `"0.0.0.0/0"` |  |
| replication.allowFrom.ipv6 | string | `"::/0"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
