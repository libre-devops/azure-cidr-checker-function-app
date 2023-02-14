data "azurerm_client_config" "current_creds" {}

data "azurerm_management_group" "current_mgmt_group" {
  display_name = "Tenant Root Group"
}

data "external" "os" {
  working_dir = path.module
  program     = ["printf", "{\"os\": \"Linux\"}"]
}

locals {
  os = data.external.os.result.os
}

output "os" {
  value = local.os
}