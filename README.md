
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




## To deploy REFIT make changes in the deploy_refit.sh script and execute using source deploy_refit.sh 
make changes at https://github.com/refit-data-streaming/refit-helmchart/blob/df538a19c966ae5598a2fe02bd54a134a07cd29b/deploy_refit.sh#L15-L19

## To access the code and respective data set in notebook pod use the script initialise_notebook.sh
source initialise_notebook.sh
make changes at https://github.com/refit-data-streaming/refit-helmchart/blob/df538a19c966ae5598a2fe02bd54a134a07cd29b/initialise_notebook.sh#L8
and https://github.com/refit-data-streaming/refit-helmchart/blob/df538a19c966ae5598a2fe02bd54a134a07cd29b/initialise_notebook.sh#L11

This will change in the future and all the codes will be in a static PV where notebook POD will be mounted and all the data will be copied to cassandra. 



# kubernetes-scripts

# refit-helmchart have 3 main directories
- env: 
   - tiger/values.yaml : values file used during helm install 
- gluster: 
   - cluster: 
      - endpoints.yaml:  
      - kustomisation.yaml 
      - service.yaml 
   - pv
   - pv-dev
- refit: 