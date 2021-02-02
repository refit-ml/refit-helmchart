# refit-helmchart
This is the repository for the REFIT Helmchart. For documentation on REFIT, see the [REFIT Repository](https://github.com/refit-ml/refit). In order to deploy REFIT to your own cluster. Follow these instructions. 

### Prerequisites
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- An existing kubernetes cluster


### Instructions
- Clone the [REFIT-Helmchart](https://github.com/refit-ml/refit-helmchart) repository
    `git clone git@github.com:refit-ml/refit-helmchart.git`
- Update helm repositories
    `helm repo update`
- Lint the REFIT Helmchart
    `helm lint ./refit`
- Update REFIT dependencies
    `helm dependency update`
- To install a new REFIT cluster
    `helm install refit ./refit --namespace refit -f values.yaml`
- To upgrade an existing REFIT cluster
    `helm upgrade refit ./refit --namespace refit -f values.yaml`