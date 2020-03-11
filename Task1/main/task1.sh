#!/bin/bash
IAC_FOLDER=$HOME/EverisChallenge/Task1/IaC
KEY=serviceaccount.json
TF_VAR_project_name=everischallenge
TF_VAR_credentials=$HOME/EverisChallenge/credentials/$KEY
TF_VAR_location=us-central1-a
TF_VAR_region=us-central1
TF_VAR_cluster_name=mypyapp-gkecluster
TF_VAR_machine_type=n1-standard-1
TF_VAR_nodepool_name=mypyapp-gkenodepool
TF_VAR_node_count=1
TASK1_EXEC=$HOME/EverisChallenge/Task1/main
K8S=$HOME/EverisChallenge/Task1/k8s
DEFAULT=vacio

chmod +x variables.sh && ./variables.sh

DEFAULT=vacio
# validad si la variable esta definida en caso no este termina el
# programa

set -euxo pipefail

echo $TF_VAR_credentials
echo $TF_VAR_region
echo $TF_VAR_location
echo $TF_VAR_project_name
echo $TF_VAR_cluster_name
echo $TF_VAR_machine_type
echo $TF_VAR_nodepool_name
echo $TF_VAR_node_count
echo $IAC_FOLDER



# validar que existe el file en la ruta 

if [[ -f "$TF_VAR_credentials" ]]
  then
    echo "El archivo  existe en la carpeta definida."
  else
    exit
fi

# ver si el argumento este definido y si no asignarle un valor

arg=${1:-$DEFAULT}

# Si la variable esta vacio se termina el programa

case $arg in 
  CREATE)
    if [$PWD != $IAC_FOLDER]
      then
        pushd $IAC_FOLDER && TF_VAR_CREDS=$CREDENTIALS terraform plan -out "mypyapp" \
        && terraform apply "mypyapp" && popd 
        cd $K8S && chmod +x kubeconfig.sh kubedeploy.sh && ./kubeconfig.sh && ./kubedeploy 

      else  
        TF_VAR_CREDS=$CREDENTIALS terraform plan -out "mypyapp" \
        && terraform apply "mypyapp" 
        cd $K8S && chmod +x kubeconfig.sh kubedeploy.sh && ./kubeconfig.sh && ./kubedeploy.sh 
    fi
      ;;
  DESTROY)
    if  [$PWD != $IAC_FOLDER] 
      then 
        pushd $IAC_FOLDER && TF_VAR_CREDS=$CREDENTIALS terraform destroy -auto-approve 
      else
        TF_VAR_CREDS=$CREDENTIALS terraform destroy -auto-approve
    fi
      ;;
  OUTPUT)
    ;;
  vacio)
    echo "no hay argumento"
esac 
