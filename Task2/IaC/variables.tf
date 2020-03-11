variable "ip_name" {
  description = "nombre de la ip asociada al ingress"
  type = string 
  default = "ip-ingress"
}
variable "SO_family" {
  description = "familia del sitema operativo  "
  type = string
  default = "centos-8"
}
variable "SO_project" {
  description = "proyectos del sitema operativo  "
  type = string
  default = "centos-cloud"
}
variable "instance_name" {
  description = "nombre de la instancia donde va instalado jenkins  "
  type = string  
  default = "vm-everis"
}
variable "machine_type" {
  description = "tipo de maquina de la instancia para jenkins"
  type = string 
  default = "f1-micro"
}
variable "zone" {
  description = "zona de google "
  type = string
  default = "us-central1-a"
}

variable "credentials" {
  description = "camino del service account  "
  type = string
  default = "/home/crati/EverisChallenge/Task1/credentials"

}
variable "project_name"{
  description = "nombre de proyecto de google "
  type = string
  default = "everis=taks2"

}
variable "zone" {
  description = "nombre de zona de google donde se despliega el proyecto "
  type = string
  default = "us-central1-a"
}
variable "region" {
  description = "nombre de zona de google donde se despliega el proyecto "
  type = string
  default = "us-central1-a"
  
}
variable "cluster_name" {
  description = "nombre del cluster gke "
  type = string
  default = "everis-taks2gke"

}
variable "nodepool_name" {
  description = "nombre del cluster gke "
  type = string
  default = "everis-taks2nodepool"
}
variable "machine_type" {
  description = "nombre del cluster gke "
  type = string
  default = "n1-standard-1"

}
variable "node_count" {
  type = string
  default = 1
}

