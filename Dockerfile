FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine
RUN gcloud components install kubectl
RUN apk update && apk add  terraform  mysql-client curl git vim  && rm -rf /var/cache/apk/*
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh && chmod 700 get_helm.sh \
&& ./get_helm.sh
RUN mkdir deployfiles
WORKDIR deployfiles
VOLUME ~/deployfiles
