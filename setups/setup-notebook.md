
changelog for refit due to service account 

- Added serviceAccountName: refit in cassandra in envs/tiger/values.yaml
- added serviceaccountname: refit in cassandra in refit/values.yaml
- added sa in refit/templates/integrations/integrations.yaml


- check the pv: refit-release-pv-20
- in new config check the content using ls    
- config map can not ship more than 3 MB, for heavy files not sure what to do, 
   - at the moment shipped everything to github, 


Notebook PV: 
r19/pv24 
r28/pv12 

kubectl exec -it refit-notebook-0 -- sh
git clone https://github.com/ramankhurana/kubernetes-scripts.git
alias 'l=ls -lhtr'
cd kubernetes-scripts
unzip notebook.zip 


- remove everything else if it seems cluttered. 
- while in the pod exec: update pip install --upgrade protobuf  
- repeat the update pip if you see the error related to protobuf- check the notebook 


kubectl logs pod/refit-notebook-0
kubectl port-forward service/refit-notebook 8888:8888 

