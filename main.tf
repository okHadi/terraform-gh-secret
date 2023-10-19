
variable "datadog_api_key" {}
variable "datadog_app_key" {}

# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

resource "datadog_monitor" "webapp_cpu_monitor" {

  name        = "Azure Web App CPU Usage"

  type        = "metric alert"

  message     = "The CPU usage of the Azure Web App has exceeded the threshold."

  query       = "max:azure.webapp.cpu{*} by {app_name} > 80"

  monitor_thresholds {

    critical = 80

  }

  notify_no_data = true

  no_data_timeframe {

    minutes = 15

  }

  tags = [

    "environment:production",

    "application:azure_webapp"

  ]

}

output "datadog_api_key" {
  value = "${var.datadog_api_key}"
}
output "datadog_app_key" {
  value = "${var.datadog_app_key}"
}