#!/bin/bash
# Script from https://github.com/EducacionMundose/mundoes/blob/main/01_eksctl/create-cluster.sh
# and modified according to my needs
# Variables
CLUSTER_NAME=eks-mundos-e
export AWS_REGION=us-east-1

# Set AWS credentials 
aws sts get-caller-identity >> /dev/null
if [ $? -eq 0 ]
then
  echo "Credenciales testeadas, proceder con la creacion de cluster."

  # Creacion de cluster
  eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $AWS_REGION \
  --nodes 3 \
  --node-type t3.small \
  --with-oidc \
  --ssh-access \
  --ssh-public-key PIN \
  --managed \
  --full-ecr-access \
  --zones us-east-1a,us-east-1b,us-east-1c

  if [ $? -eq 0 ]
  then
    echo "Cluster Setup Completo con eksctl ."
  else
    echo "Cluster Setup Falló mientras se ejecuto eksctl."
  fi
else
  echo "Please run aws configure & set right credentials."
  echo "Cluster setup failed."
fi