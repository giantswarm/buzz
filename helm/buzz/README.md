# buzz

Buzz, a self-hostable Nostr relay workspace where people and AI agents share channels, repositories and workflows.

**Homepage:** <https://github.com/giantswarm/buzz>

## Source Code

* <https://github.com/block/buzz>
* <https://github.com/giantswarm/buzz>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://charts/postgres | postgresql(postgres) | 0.19.5 |
| file://charts/redis | redis | 0.30.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| quickstart | bool | `false` |  |
| image.repository | string | `"gsoci.azurecr.io/giantswarm/buzz"` |  |
| image.tag | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| replicaCount | int | `1` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `5` |  |
| autoscaling.maxReplicas | int | `15` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `65` |  |
| autoscaling.websocketMetricEnabled | bool | `true` |  |
| autoscaling.websocketMetricName | string | `"buzz_ws_connections_active"` |  |
| autoscaling.targetWebsocketConnections | int | `5000` |  |
| autoscaling.behavior.scaleUp.stabilizationWindowSeconds | int | `0` |  |
| autoscaling.behavior.scaleUp.policies[0].type | string | `"Percent"` |  |
| autoscaling.behavior.scaleUp.policies[0].value | int | `100` |  |
| autoscaling.behavior.scaleUp.policies[0].periodSeconds | int | `60` |  |
| autoscaling.behavior.scaleUp.policies[1].type | string | `"Pods"` |  |
| autoscaling.behavior.scaleUp.policies[1].value | int | `4` |  |
| autoscaling.behavior.scaleUp.policies[1].periodSeconds | int | `60` |  |
| autoscaling.behavior.scaleUp.selectPolicy | string | `"Max"` |  |
| autoscaling.behavior.scaleDown.stabilizationWindowSeconds | int | `600` |  |
| autoscaling.behavior.scaleDown.policies[0].type | string | `"Pods"` |  |
| autoscaling.behavior.scaleDown.policies[0].value | int | `1` |  |
| autoscaling.behavior.scaleDown.policies[0].periodSeconds | int | `120` |  |
| autoscaling.behavior.scaleDown.selectPolicy | string | `"Min"` |  |
| relayUrl | string | `""` |  |
| mediaBaseUrl | string | `""` |  |
| ownerPubkey | string | `""` |  |
| secrets.existingSecret | string | `""` |  |
| secrets.relayPrivateKey | string | `""` |  |
| secrets.gitHookHmacSecret | string | `""` |  |
| relay.bindAddr | string | `"0.0.0.0:3000"` |  |
| relay.maxConnections | int | `10000` |  |
| relay.maxConcurrentHandlers | int | `1024` |  |
| relay.sendBuffer | int | `1000` |  |
| relay.drainJitterMs | int | `0` |  |
| relay.requireAuthToken | bool | `true` |  |
| relay.requireRelayMembership | bool | `true` |  |
| relay.allowNipOaAuth | bool | `true` |  |
| relay.pubkeyAllowlist | bool | `false` |  |
| relay.corsOrigins | list | `[]` |  |
| relay.huddleAudioAvailable | string | `nil` |  |
| relay.ephemeralTtlOverride | int | `0` |  |
| relay.uploadRecords | bool | `false` |  |
| relay.uploadIpHeader | string | `""` |  |
| relay.uploadPortHeader | string | `""` |  |
| relay.livenessProbe.httpGet.path | string | `"/_liveness"` |  |
| relay.livenessProbe.httpGet.port | string | `"health"` |  |
| relay.livenessProbe.initialDelaySeconds | int | `5` |  |
| relay.livenessProbe.periodSeconds | int | `10` |  |
| relay.livenessProbe.timeoutSeconds | int | `3` |  |
| relay.livenessProbe.failureThreshold | int | `3` |  |
| relay.readinessProbe.httpGet.path | string | `"/_readiness"` |  |
| relay.readinessProbe.httpGet.port | string | `"health"` |  |
| relay.readinessProbe.initialDelaySeconds | int | `5` |  |
| relay.readinessProbe.periodSeconds | int | `5` |  |
| relay.readinessProbe.timeoutSeconds | int | `3` |  |
| relay.readinessProbe.failureThreshold | int | `3` |  |
| relay.startupProbe.httpGet.path | string | `"/_liveness"` |  |
| relay.startupProbe.httpGet.port | string | `"health"` |  |
| relay.startupProbe.failureThreshold | int | `60` |  |
| relay.startupProbe.periodSeconds | int | `2` |  |
| relay.resources.requests.cpu | string | `"500m"` |  |
| relay.resources.requests.memory | string | `"512Mi"` |  |
| relay.resources.limits.cpu | string | `"2"` |  |
| relay.resources.limits.memory | string | `"2Gi"` |  |
| relay.podAnnotations | object | `{}` |  |
| relay.podLabels."application.giantswarm.io/team" | string | `"bumblebee"` |  |
| relay.nodeSelector | object | `{}` |  |
| relay.tolerations | list | `[]` |  |
| relay.affinity | object | `{}` |  |
| relay.topologySpreadConstraints | list | `[]` |  |
| relay.securityContext.runAsNonRoot | bool | `true` |  |
| relay.securityContext.runAsUser | int | `65532` |  |
| relay.securityContext.runAsGroup | int | `65532` |  |
| relay.securityContext.fsGroup | int | `65532` |  |
| relay.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| relay.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| relay.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| relay.containerSecurityContext.readOnlyRootFilesystem | bool | `false` |  |
| relay.terminationGracePeriodSeconds | int | `60` |  |
| relay.command | list | `[]` |  |
| relay.args | list | `[]` |  |
| relay.extraVolumeMounts | list | `[]` |  |
| relay.extraEnv | list | `[]` |  |
| relay.extraEnvFrom | list | `[]` |  |
| extraInitContainers | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| pairingRelay.enabled | bool | `false` |  |
| pairingRelay.url | string | `""` |  |
| pairingRelay.replicaCount | int | `1` |  |
| pairingRelay.service.type | string | `"ClusterIP"` |  |
| pairingRelay.service.port | int | `5000` |  |
| pairingRelay.service.annotations | object | `{}` |  |
| pairingRelay.podAnnotations | object | `{}` |  |
| pairingRelay.podLabels | object | `{}` |  |
| pairingRelay.resources.requests.cpu | string | `"50m"` |  |
| pairingRelay.resources.requests.memory | string | `"32Mi"` |  |
| pairingRelay.resources.limits.cpu | string | `"250m"` |  |
| pairingRelay.resources.limits.memory | string | `"128Mi"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `3000` |  |
| service.healthPort | int | `8080` |  |
| service.metricsPort | int | `9102` |  |
| service.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| podDisruptionBudget.enabled | bool | `true` |  |
| podDisruptionBudget.minAvailable | int | `1` |  |
| podDisruptionBudget.maxUnavailable | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| httproute.enabled | bool | `false` |  |
| httproute.parentRefs | list | `[]` |  |
| httproute.hostnames | list | `[]` |  |
| httproute.rules | list | `[]` |  |
| persistence.git.enabled | bool | `true` |  |
| persistence.git.mountPath | string | `"/var/lib/buzz/git"` |  |
| persistence.git.storageClass | string | `""` |  |
| persistence.git.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.git.size | string | `"10Gi"` |  |
| persistence.git.annotations | object | `{}` |  |
| persistence.git.existingClaim | string | `""` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.image.registry | string | `"gsoci.azurecr.io"` |  |
| postgresql.image.repository | string | `"giantswarm/postgres"` |  |
| postgresql.image.tag | string | `"18.4"` |  |
| postgresql.auth.database | string | `"buzz"` |  |
| postgresql.auth.username | string | `"buzz"` |  |
| postgresql.auth.existingSecret | string | `"{{ if contains \"buzz\" .Release.Name }}{{ .Release.Name }}-relay{{ else }}{{ .Release.Name }}-buzz-relay{{ end }}"` |  |
| postgresql.auth.secretKeys.adminPasswordKey | string | `"postgres-password"` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.size | string | `"10Gi"` |  |
| externalPostgresql.url | string | `""` |  |
| redis.enabled | bool | `false` |  |
| redis.image.registry | string | `"gsoci.azurecr.io"` |  |
| redis.image.repository | string | `"giantswarm/redis"` |  |
| redis.image.tag | string | `"8.8.0"` |  |
| redis.auth.existingSecret | string | `"{{ if contains \"buzz\" .Release.Name }}{{ .Release.Name }}-relay{{ else }}{{ .Release.Name }}-buzz-relay{{ end }}"` |  |
| redis.auth.existingSecretPasswordKey | string | `"redis-password"` |  |
| redis.persistence.enabled | bool | `true` |  |
| redis.persistence.size | string | `"4Gi"` |  |
| externalRedis.url | string | `""` |  |
| s3.endpoint | string | `""` |  |
| s3.bucket | string | `"buzz-media"` |  |
| s3.region | string | `""` |  |
| s3.addressingStyle | string | `"path"` |  |
| s3.accessKey | string | `""` |  |
| s3.secretKey | string | `""` |  |
| s3.existingSecret.name | string | `""` |  |
| s3.existingSecret.key | string | `"BUZZ_S3_SECRET_KEY"` |  |
| minio.enabled | bool | `false` |  |
| minio.image | string | `"gsoci.azurecr.io/giantswarm/buzz-minio:0.3.1-rc.1"` |  |
| minio.mcImage | string | `"gsoci.azurecr.io/giantswarm/buzz-minio:0.3.1-rc.1"` |  |
| minio.persistence.enabled | bool | `true` |  |
| minio.persistence.size | string | `"10Gi"` |  |
| git.maxPackBytes | int | `524288000` |  |
| git.packCachePath | string | `"/var/cache/buzz/git-packs"` |  |
| git.packCacheMaxBytes | int | `5368709120` |  |
| git.packCacheMaxConcurrentPopulations | int | `2` |  |
| git.packCacheVolumeSize | string | `"7Gi"` |  |
| git.maxReposPerPubkey | int | `100` |  |
| git.maxConcurrentOps | int | `20` |  |
| migrate.autoMigrate | bool | `true` |  |
| migrate.preUpgradeJob.enabled | bool | `false` |  |
| migrate.preUpgradeJob.resources | object | `{}` |  |
| migrate.preUpgradeJob.backoffLimit | int | `3` |  |
| migrate.preUpgradeJob.activeDeadlineSeconds | int | `600` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.namespace | string | `""` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| serviceMonitor.labels | object | `{}` |  |
| extraManifests | list | `[]` |  |
