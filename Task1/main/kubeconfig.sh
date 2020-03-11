#! /usr/bin/bash
#previamente loggueado se debe establecer las credenciales para conectarse
# a kubernetes para ello debemos obtener el kubeconfig

gcloud config set project $TF_VAR_PROJECTNAME
gcloud config set compute/zone $TF_VAR_ZONE
gcloud container cluster get-credentials $TF_VAR_GKECLUSTER


