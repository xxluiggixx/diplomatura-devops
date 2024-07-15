#!/bin/bash
echo "############################################"
echo "Delete deploy"
kubectl delete -f /tmp/nginx-deploy.yml

echo "############################################"
echo "Delete Prometheus and grafana"

helm uninstall prometheus --namespace prometheus 
kubectl delete ns prometheus 
helm uninstall grafana --namespace grafana 
kubectl delete ns grafana 


echo "############################################"
echo "Delete cluster EKS"
eksctl delete cluster --name eks-mundos-e