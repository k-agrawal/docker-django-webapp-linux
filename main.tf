terraform {
  backend "azurerm" {
  
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_app_service_plan" "example" {
  name                = "docker-appserviceplan"
  location            = "eastus"
  resource_group_name = "con-tf-ex-rg"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "docker-app-service"
  location            = "eastus"
  resource_group_name = "con-tf-ex-rg"
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
