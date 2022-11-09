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




### Usage on the Tiger cluster

Often times the tiger cluster looses connection to the gluster endpoints and pods are not able to mount to their volumes. To resolve this just run these commands and the gluster endpoints and pods will be reset. 

- `chmod +x fix-pods.sh`
- `./fix-pods.sh`


## If unable to open the notebook using 127.0.0.1:8888 try to login again using 
### this is indeed necessary otherwise refit_init will not work while loading the schema 
ssh -i ......  -L 8888:localhost:8888

