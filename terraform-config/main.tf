# main.tf

# Define the Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Create a namespace (optional)
resource "kubernetes_namespace" "default" {
  metadata {
    name = "default-namespace"
  }
}

# Reference the app-deployment YAML file
resource "kubernetes_manifest" "app_deployment" {
  manifest = yamldecode(file("${path.module}/k8s/app-deployment.yaml"))
}

# Reference the db-deployment YAML file
resource "kubernetes_manifest" "db_deployment" {
  manifest = yamldecode(file("${path.module}/k8s/db-deployment.yaml"))
}

# Reference the PersistentVolumeClaim YAML file
resource "kubernetes_manifest" "db_pvc" {
  manifest = yamldecode(file("${path.module}/k8s/db-pvc.yaml"))
}

# Reference the db-service YAML file
resource "kubernetes_manifest" "db_service" {
  manifest = yamldecode(file("${path.module}/k8s/db-service.yaml"))
}

# Reference the app-service YAML file
resource "kubernetes_manifest" "app_service" {
  manifest = yamldecode(file("${path.module}/k8s/service.yaml"))
}

# Reference the HPA YAML file
resource "kubernetes_manifest" "app_hpa" {
  manifest = yamldecode(file("${path.module}/k8s/hpa.yaml"))
}