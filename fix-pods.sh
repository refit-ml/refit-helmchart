#! /bin/sh

kubectl apply -k gluster

kubectl get pods -n refit --field-selector 'status.phase!=Running' -o name | xargs kubectl delete