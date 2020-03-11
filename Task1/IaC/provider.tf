provider "google"{
  credentials = file(var.CREDENTIALS)
  project = var.PROJECTNAME 
  region = var.REGION 

}
