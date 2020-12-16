package main

import data.kubernetes

name = input.metadata.name

required_route_secure {
    input.spec.tls.termination = "edge"
    input.spec.tls.insecureEdgeTerminationPolicy = "Redirect"
}

deny[msg] {
    input.kind = "Route"
    not required_route_secure

    msg = sprintf("Route must be secured", [name])
}