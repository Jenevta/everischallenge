#! /usr/bin/bash

set -euxo pipefail
cd $HOME/EverisChallenge/Task1
kubectl create namespace mypyapp
kubectl create namespace ingress-mypyapp 
kubectl apply -f mypyapp.yaml --namespace=mypyapp
IP=$(gcloud compute addresses list | awk 'NR>1 { print $2}')
helm install --name nginx-ingress stable/nginx-ingress \
    --namespace ingress-mypyapp \
    --set rbac.create=false \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.replicaCount=2 \
    --set controller.publishService.enabled=true
    --set controller.service.loadBalancerIP=$IP  
kubectl apply -f ingress-mypyapp.yaml --namespace=mypyapp


