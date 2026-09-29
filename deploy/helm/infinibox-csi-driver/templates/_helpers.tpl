{{/*
Render a map of labels with every value quoted, so values such as
true or 123 passed with --set are emitted as strings, as Kubernetes
requires. A null value drops the label, matching how helm treats null.
Usage: {{ include "infinibox-csi-driver.labels" $labels | nindent 4 }}
*/}}
{{- define "infinibox-csi-driver.labels" -}}
{{- $lines := list -}}
{{- range $key, $value := . -}}
{{- if not (kindIs "invalid" $value) -}}
{{- $lines = append $lines (printf "%s: %s" $key (toString $value | quote)) -}}
{{- end -}}
{{- end -}}
{{- join "\n" $lines -}}
{{- end -}}
