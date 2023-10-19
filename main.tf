terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}
variable "datadog_api_key" {}
variable "datadog_app_key" {}

# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

resource "datadog_monitor" "example_monitor" {
  name               = "Example Monitor"
  type               = "metric alert"
  query              = "avg(last_1h):sum:system.cpu.idle{*} < 75"
  message            = "CPU idle is below 75% for the last hour"
  escalation_message = "Alerting for an extended period"

}


output "datadog_api_key" {
  value = "${var.datadog_api_key}"
}
output "datadog_app_key" {
  value = "${var.datadog_app_key}"
}