# Tor + Kubernetes

Currently:
- Installed [Emissary](https://www.getambassador.io/docs/emissary/latest/tutorials/getting-started/) as an Ingress Controller.

Figure out [locustio bug for spawning multiple users](https://github.com/locustio/locust/wiki/Installation#increasing-maximum-number-of-open-files-limit).

Plan is to:
1. Load test using src/loadgenerator/locustfile.py.
    - Response times (50-99 percentile, multiple users, request types/endpoints)

2. Install Tor in Emissary.
    - FFI bindings Golang/Rust.
    - gRPCs (encryption microservice in the gateway?).
