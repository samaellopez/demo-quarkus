package main

import data.kubernetes

name = input.metadata.name
warn[msg] {
    input.kind = "Service"
    msg = sprintf("Found service %s , this deployment will be exposed!!", [name])
}

exception[rules] {
    input.kind = "Service"
    input.metadata.name = "apiventasol"

    rules = ["expose_service"]
}