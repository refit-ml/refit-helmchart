changelog 

1. change pvc.yaml: 
from 
 storageClassName: manual
to
 storageClassName: refit



2. change pvc.yaml 
from  accessModes:
  - ReadWriteMany


to  accessModes:
  - ReadWriteOnce



3. Add   persistence:
    enabled: true
    storageClass: refit
in refit/values.yaml:postgres section



4. one PV without storageclass name
  - This worked. Becuase postgresql does not have storageclassname defined int he deployment/pod/statefulset. 

Next steps: 
- install postgresql independently using helm 
- load a dataset (static dataset) 
- read the dataset (static dataset) 
- execute some queries to test everything is working. 
- Test how can this be used in the REFIT. 
- how to load the static data in postgres using refit API
- how to perform the join of static and streaming data. 