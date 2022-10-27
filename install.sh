#!/usr/bin/env bash
# Following https://www.getambassador.io/docs/emissary/latest/tutorials/getting-started/

helm repo add datawire https://app.getambassador.io
helm repo update

kubectl create namespace emissary && \
kubectl apply -f https://app.getambassador.io/yaml/emissary/3.2.0/emissary-crds.yaml
kubectl wait --timeout=90s --for=condition=available deployment emissary-apiext -n emissary-system
helm install emissary-ingress --namespace emissary datawire/emissary-ingress && \
kubectl -n emissary wait --for condition=available --timeout=90s deploy -lapp.kubernetes.io/instance=emissary-ingress

# Apply a Listener
kubectl apply -f emissary-listener.yaml

# Apply a Mapping
kubectl apply -f emissary-mapping.yaml

# Use `minikube service` to work out how to access the IP of the LoadBalancer of emissary
minikube service -n emissary emissary-ingress --url=true
