terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}
variable "datadog_api_key" {}


# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  #app_key = var.datadog_app_key
}

#