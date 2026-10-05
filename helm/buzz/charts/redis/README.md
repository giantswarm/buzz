# redis

![Version: 0.30.3](https://img.shields.io/badge/Version-0.30.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8.8.0](https://img.shields.io/badge/AppVersion-8.8.0-informational?style=flat-square)

An open source, in-memory data structure store used as a database, cache, and message broker.

**Homepage:** <https://www.redis.io>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| CloudPirates GmbH & Co. KG | <hello@cloudpirates.io> | <https://www.cloudpirates.io> |

## Source Code

* <https://github.com/CloudPirates-io/helm-charts/tree/main/charts/redis>
* <https://github.com/redis/redis>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/cloudpirates | common | 2.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.imageRegistry | string | `""` |  |
| global.imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| clusterDomain | string | `"cluster.local"` |  |
| commonLabels | object | `{}` |  |
| commonAnnotations | object | `{}` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"redis"` |  |
| image.tag | string | `"8.8.0@sha256:aa049e689e141a4358ad1d4562dc49c88a89fbab711fd8fcc33f684c80b26301"` |  |
| image.pullPolicy | string | `"Always"` |  |
| architecture | string | `"standalone"` |  |
| replicaCount | int | `3` |  |
| clusterReplicaCount | int | `0` |  |
| revisionHistoryLimit | int | `10` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| updateStrategy.rollingUpdate.maxUnavailable | int | `1` |  |
| useDeployment | bool | `false` |  |
| podLabels | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| ipFamily | string | `"auto"` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `6379` |  |
| service.nodePort | string | `""` |  |
| service.clusterPort | int | `16379` |  |
| service.ipFamilies | list | `[]` |  |
| service.ipFamilyPolicy | string | `""` |  |
| service.headless.annotations | object | `{}` |  |
| service.headless.ipFamilies | list | `[]` |  |
| service.headless.ipFamilyPolicy | string | `""` |  |
| auth.enabled | bool | `true` |  |
| auth.sentinel | bool | `true` |  |
| auth.password | string | `""` |  |
| auth.existingSecret | string | `""` |  |
| auth.existingSecretPasswordKey | string | `"redis-password"` |  |
| auth.acl.enabled | bool | `false` |  |
| auth.acl.existingSecret | string | `""` |  |
| auth.acl.existingSecretACLKey | string | `""` |  |
| auth.acl.existingFilePath | string | `""` |  |
| tls.enabled | bool | `false` |  |
| tls.existingSecret | string | `""` |  |
| tls.certFilename | string | `"tls.crt"` |  |
| tls.certKeyFilename | string | `"tls.key"` |  |
| tls.certCAFilename | string | `"ca.crt"` |  |
| tls.port | int | `6380` |  |
| tls.authClients | bool | `true` |  |
| tls.client.existingSecret | string | `""` |  |
| tls.client.certFilename | string | `"tls.crt"` |  |
| tls.client.certKeyFilename | string | `"tls.key"` |  |
| config.mountPath | string | `"/usr/local/etc/redis"` |  |
| config.content | string | `"# Redis configuration\nbind * -::*\n"` |  |
| config.existingConfigmap | string | `""` |  |
| config.existingConfigmapKey | string | `""` |  |
| cluster.announceHostnames | bool | `false` |  |
| cluster.startupSleepTime | int | `0` |  |
| cluster.config.nodeTimeout | int | `15000` |  |
| cluster.config.requireFullCoverage | bool | `true` |  |
| extraConfig | string | `""` |  |
| pdb.enabled | bool | `false` |  |
| pdb.minAvailable | int | `1` |  |
| pdb.maxUnavailable | string | `""` |  |
| persistence.enabled | bool | `true` |  |
| persistence.storageClass | string | `""` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.mountPath | string | `"/data"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.subPath | string | `""` |  |
| persistence.labels | object | `{}` |  |
| volumePermissions.enabled | bool | `false` |  |
| volumePermissions.image.registry | string | `"docker.io"` |  |
| volumePermissions.image.repository | string | `"busybox"` |  |
| volumePermissions.image.tag | string | `"1.36.1"` |  |
| volumePermissions.image.pullPolicy | string | `"IfNotPresent"` |  |
| volumePermissions.resources | object | `{}` |  |
| persistentVolumeClaimRetentionPolicy.enabled | bool | `false` |  |
| persistentVolumeClaimRetentionPolicy.whenScaled | string | `"Retain"` |  |
| persistentVolumeClaimRetentionPolicy.whenDeleted | string | `"Retain"` |  |
| resources | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| priorityClassName | string | `""` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| terminationGracePeriodSeconds | int | `30` |  |
| topologySpreadConstraints | list | `[]` |  |
| containerSecurityContext.runAsUser | int | `999` |  |
| containerSecurityContext.runAsGroup | int | `999` |  |
| containerSecurityContext.runAsNonRoot | bool | `true` |  |
| containerSecurityContext.privileged | bool | `false` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| podSecurityContext.fsGroup | int | `999` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.successThreshold | int | `1` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.successThreshold | int | `1` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.successThreshold | int | `1` |  |
| extraEnvVars | list | `[]` |  |
| extraFlags | list | `[]` |  |
| extraPorts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| sentinel.enabled | bool | `false` |  |
| sentinel.image.registry | string | `"docker.io"` |  |
| sentinel.image.repository | string | `"redis"` |  |
| sentinel.image.tag | string | `"8.6.1@sha256:315270d166080f537bbdf1b489b603aaaa213cb55a544acfa51feb7481abb1c0"` |  |
| sentinel.image.pullPolicy | string | `"Always"` |  |
| sentinel.config.announceHostnames | bool | `true` |  |
| sentinel.config.loglevel | string | `"notice"` |  |
| sentinel.masterName | string | `"mymaster"` |  |
| sentinel.monitorTarget | string | `""` |  |
| sentinel.quorum | int | `2` |  |
| sentinel.downAfterMilliseconds | int | `1500` |  |
| sentinel.failoverTimeout | int | `15000` |  |
| sentinel.parallelSyncs | int | `1` |  |
| sentinel.port | int | `26379` |  |
| sentinel.discoveryTimeout | int | `3` |  |
| sentinel.extraVolumeMounts | list | `[]` |  |
| sentinel.service.type | string | `"ClusterIP"` |  |
| sentinel.service.port | int | `26379` |  |
| sentinel.service.ipFamilies | list | `[]` |  |
| sentinel.service.ipFamilyPolicy | string | `""` |  |
| sentinel.resources | object | `{}` |  |
| sentinel.redisShutdownWaitFailover | bool | `true` |  |
| sentinel.masterService.enabled | bool | `false` |  |
| sentinel.masterService.type | string | `""` |  |
| sentinel.masterService.annotations | object | `{}` |  |
| sentinel.masterService.ipFamilies | list | `[]` |  |
| sentinel.masterService.ipFamilyPolicy | string | `""` |  |
| sentinel.masterService.checkInterval | int | `60` |  |
| sentinel.masterService.image.repository | string | `"alpine/kubectl"` |  |
| sentinel.masterService.image.tag | string | `"1.35.2"` |  |
| sentinel.masterService.image.pullPolicy | string | `"IfNotPresent"` |  |
| sentinel.masterService.resources | object | `{}` |  |
| sentinel.masterService.verbose | bool | `false` |  |
| sentinel.masterService.affinity | object | `{}` |  |
| sentinel.livenessProbe.enabled | bool | `true` |  |
| sentinel.livenessProbe.initialDelaySeconds | int | `30` |  |
| sentinel.livenessProbe.periodSeconds | int | `10` |  |
| sentinel.livenessProbe.timeoutSeconds | int | `5` |  |
| sentinel.livenessProbe.failureThreshold | int | `6` |  |
| sentinel.livenessProbe.successThreshold | int | `1` |  |
| sentinel.readinessProbe.enabled | bool | `true` |  |
| sentinel.readinessProbe.initialDelaySeconds | int | `5` |  |
| sentinel.readinessProbe.periodSeconds | int | `10` |  |
| sentinel.readinessProbe.timeoutSeconds | int | `5` |  |
| sentinel.readinessProbe.failureThreshold | int | `6` |  |
| sentinel.readinessProbe.successThreshold | int | `1` |  |
| sentinel.preStop.enabled | bool | `true` |  |
| initContainer.resources | object | `{}` |  |
| metrics.enabled | bool | `false` |  |
| metrics.image.registry | string | `"docker.io"` |  |
| metrics.image.repository | string | `"oliver006/redis_exporter"` |  |
| metrics.image.tag | string | `"v1.82.0-alpine@sha256:da9e89ee4e755bfa1b6a6b2ed345c2de63ca3976f95c9f1e9538882bc1414cb8"` |  |
| metrics.image.pullPolicy | string | `"Always"` |  |
| metrics.resources | object | `{}` |  |
| metrics.extraArgs | list | `[]` |  |
| metrics.service.type | string | `"ClusterIP"` |  |
| metrics.service.port | int | `9121` |  |
| metrics.service.annotations | object | `{}` |  |
| metrics.service.loadBalancerIP | string | `""` |  |
| metrics.service.loadBalancerSourceRanges | list | `[]` |  |
| metrics.service.clusterIP | string | `""` |  |
| metrics.service.nodePort | string | `""` |  |
| metrics.service.ipFamilies | list | `[]` |  |
| metrics.service.ipFamilyPolicy | string | `""` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.namespace | string | `""` |  |
| metrics.serviceMonitor.interval | string | `"30s"` |  |
| metrics.serviceMonitor.scrapeTimeout | string | `""` |  |
| metrics.serviceMonitor.relabelings | list | `[]` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.honorLabels | bool | `false` |  |
| metrics.serviceMonitor.selector | object | `{}` |  |
| metrics.serviceMonitor.annotations | object | `{}` |  |
| metrics.serviceMonitor.namespaceSelector | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.annotations | object | `{}` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.allowExternal | bool | `true` |  |
| networkPolicy.egressEnabled | bool | `true` |  |
| networkPolicy.extraIngress | list | `[]` |  |
| networkPolicy.extraEgress | list | `[]` |  |
| extraObjects | list | `[]` |  |
| customScripts.postStart.enabled | bool | `false` |  |
| customScripts.postStart.command | list | `[]` |  |
| customScripts.preStop.enabled | bool | `false` |  |
| customScripts.preStop.command | list | `[]` |  |
| clusterInitJob.resources | object | `{}` |  |

