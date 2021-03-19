terraform {
  required_version = ">= 0.11"
  backend "azurerm" {
    storage_account_name = "$(armazenamentotf)"
    container_name = "container"
    key = "container.tfstate"
    access_key ="$(chaveacesso)"
    features{}
    }
  }
  provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "lab" {
  name     = "$(nomergterraform)"
  location = "$(localizacao)"
}

resource "azurerm_app_service_plan" "lab" {
  name                = "$(appserviceplan)"
  location            = "${azurerm_resource_group.lab.location}"
  resource_group_name = "${azurerm_resource_group.lab.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "lab" {
  name                = "$(nomeappservice)"
  location            = "${azurerm_resource_group.lab.location}"
  resource_group_name = "${azurerm_resource_group.lab.name}"
  app_service_plan_id = "${azurerm_app_service_plan.lab.id}"

}