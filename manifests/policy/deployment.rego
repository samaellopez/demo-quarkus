package main

import data.kubernetes

name = input.metadata.name

deny[msg] {
    input.kind = "Deployment"
    input.spec.template.spec.securityContext.runAsNonRoot
    msg = sprintf("Containers must run as root in Deployment %s", [name])
}

required_deployment_labels {
    input.metadata.labels["app.kubernetes.io/name"]
    input.metadata.labels["app.openshift.io/runtime"]
}

deny [msg] {
    input.kind = "Deployment"
    not required_deployment_labels

    msg = sprintf("Deployment %s must provide required labels: name, runtime", [name])
}