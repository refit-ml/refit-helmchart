##
# Raman Khurana 
# October 24, 2022 
# version 1:
# collected set of commands to deploy refit on tiger cluster 
# First basic version, 

## to be added 
# 1. add safety checks 
# 2. first time 
# 3. read the command line options from yaml/text file to ensure that all information is intact, namespace, dir, version etc, 
# 4. 


NAMESPACE=refit-release
GLUSTERDIR=r26

NAMESPACEOLD=refit-rk-test
GLUSTERDIROLD=r25


## setup environment 
kubectl config use kubernetes-admin@kubernetes
kubectl config set-context --current --namespace $NAMESPACE

## create directory structure 
mkdir  /mnt-gluster/cdl-data/refit/$GLUSTERDIR
chmod -R 777 /mnt-gluster/cdl-data/refit/$GLUSTERDIR
source create_volumes.sh $GLUSTERDIR


## add the backup logic: to be done when there is some data in the /mnt-gluster/cdl-data/refit/$GLUSTERDIR/* directories 
#  -- 
# .. 
#   === 


## add following for the first time 
#helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
#helm repo add minio https://helm.min.io/
#helm repo add bitnami https://charts.bitnami.com/bitnami
#helm repo add apache https://pulsar.apache.org/charts
#helm repo add stable https://charts.helm.sh/stable
#cd refit
#update the packages in Charts.yaml to recent stable versions
#helm dependency build


## change the configurations 
sed -i "s/$NAMESPACEOLD/$NAMESPACE/g" gluster/cluster/kustomization.yaml
sed -i "s/$NAMESPACEOLD/$NAMESPACE/g" gluster/pv/kustomization.yaml
sed -i "s/$NAMESPACEOLD/$NAMESPACE/g" gluster/pv/pv.yaml
sed -i "s/$GLUSTERDIROLD/$GLUSTERDIR/g" gluster/pv/pv.yaml

## create namesapce and apply changes to the gluster 

kubectl create namespace $NAMESPACE
kubectl config set-context --current --namespace $NAMESPACE

kubectl apply -k gluster/cluster
sleep 5 ## not sure if this is needed, but just to be safe for now. 
kubectl apply -k gluster/cluster ##[yes this has to be done twice ]

kubectl apply -k gluster/pv



## Choice of node where refit will be deployed: to be done later 

## edit the github release   refit/values.yaml

## deploy refit 
helm install refit ./refit --namespace $NAMESPACE -f envs/tiger/values.yaml



