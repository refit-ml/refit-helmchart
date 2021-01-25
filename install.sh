#! /bin/sh
set -e 

ACTION="$1"

# helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
# helm repo add minio https://helm.min.io/
# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm repo add apache https://pulsar.apache.org/charts
# helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm repo update

helm lint ./refit

cd refit 

helm dependency update

cd ../

# helm install --dry-run --debug --generate-name ./refit


# if [ "$ACTION" != "install" ]; then
#     ACTION="upgrade"
# fi


# helm $ACTION refit ./refit -f envs/local/values.yaml

# To install on tiger 
# helm install refit ./refit --namespace refit -f envs/tiger/values.yaml
helm upgrade refit ./refit --namespace refit -f envs/tiger/values.yaml

# helm upgrade refit ./refit --namespace refit -f envs/tiger/values.yaml