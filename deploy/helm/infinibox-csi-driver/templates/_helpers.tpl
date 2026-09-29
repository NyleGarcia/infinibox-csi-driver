{{/*
Render a map of labels with every value quoted, so values such as
true or 123 passed with --set are emitted as strings, as Kubernetes
requires. A null value renders as "".
Usage: {{ include "infinibox-csi-driver.labels" $labels | nindent 4 }}
*/}}
{{- define "infinibox-csi-driver.labels" -}}
{{- $lines := list -}}
{{- range $key, $value := . -}}
{{- $lines = append $lines (printf "%s: %s" $key (kindIs "invalid" $value | ternary "" (toString $value) | quote)) -}}
{{- end -}}
{{- join "\n" $lines -}}
{{- end -}}
