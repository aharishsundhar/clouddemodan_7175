terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = ">= 0.13"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}
resource "mongodbatlas_project" "example" {
  name   = var.project
  org_id = var.orgid
}

resource "mongodbatlas_database_user" "example" {
  project_id         = mongodbatlas_project.example.id
  username           = var.dbusername
  password           = var.dbpassword
  auth_database_name = "admin"
  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
  provisioner "local-exec" {
    command = [
    	"atlas cluster create $CLUSTER_NAME --provider AZURE --region US_EAST_2 --tier M0 --projectId ${self.project_id}",
    	"atlas cluster cs describe $CLUSTER_NAME"
    ]
     environment = {
      CLUSTER_NAME = var.clustername
    }
  }
  
  // Other user configuration options
}
