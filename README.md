# Tor + Kubernetes
Currently:
- Installed [Emissary](https://www.getambassador.io/docs/emissary/latest/tutorials/getting-started/) as an Ingress Controller.

Plan is to:
1. Load test using src/loadgenerator/locustfile.py.
    - Figure out [locustio bug for spawning multiple users](https://github.com/locustio/locust/wiki/Installation#increasing-maximum-number-of-open-files-limit).
    - Response times (50-99 percentile, multiple users, request types/endpoints)

2. Install Tor in Emissary.
    - FFI bindings Golang/Rust.
    - gRPCs (encryption microservice in the gateway?).

## Setup
Follow the steps in [install.sh](./install.sh)

## SOCKS hacking
### Lachie
- [x] Check that SOCKS ping works with ~arti~
- [x] Run arti (which exposes a SOCKS socket)
- [-] Understand the emissary architecture
- [ ] Note where we insert the SOCKS calls.
- [ ] Try to install emissary from src in k8s network (DEVELOPING.md)

### Ocean
- [ ] Find a [SOCKS implementation](https://pkg.go.dev/golang.org/x/net/internal/socks) in Golang (or write it ourselves)
- [ ] Confirm that we can ping ~arti~ through this implementation in the same way as `httping -x 127.0.0.1:9150 -g http://www.google.com -5`.

### Together
- [ ] Connect to ~arti~ from customized emissary installed on local k8s cluster.
- [ ] Send all packets to that ~arti~ connection, rather than via the device interface.
- [ ] Profile? Ask Theo.

