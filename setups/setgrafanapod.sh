## disable all nodes from scheduling, check if something is missing
kubectl cordon mlds-deepdish4;kubectl cordon ptuj.iems.private; kubectl cordon mlds-deepdish3; kubectl cordon mlds-deepdish1; kubectl cordon wcdl0.deeplearninglab.northwestern.edu; kubectl cordon osp.iems.private; kubectl cordon wcdl1.deeplearninglab.northwestern.edu; kubectl cordon ljubljana.iems.private; kubectl cordon celje.iems.private; kubectl cordon wcdl3;kubectl cordon mlds-deepdish2;

## delete the grafana pod 
a=`kubectl get pods | grep "refit-grafana" | gawk '{print $1}'`
kubectl delete pod $a


## enable all nodes back to normal, 
kubectl uncordon mlds-deepdish4;kubectl uncordon ptuj.iems.private; kubectl uncordon mlds-deepdish3; kubectl uncordon mlds-deepdish1; kubectl uncordon wcdl0.deeplearninglab.northwestern.edu; kubectl uncordon osp.iems.private; kubectl uncordon wcdl1.deeplearninglab.northwestern.edu; kubectl uncordon ljubljana.iems.private; kubectl uncordon celje.iems.private;kubectl uncordon wcdl3; kubectl uncordon mlds-deepdish2;
