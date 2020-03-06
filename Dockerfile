FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine
RUN gcloud components install kubectl
RUN apk update && apk add  terraform  mysql-client curl git vim  && rm -rf /var/cache/apk/*
