resource "azuread_application" "github-actions-ar" {
  display_name = "github-actions-ar"
}

resource "azuread_application_password" "github-actions-app-secret" {
  application_id = azuread_application.github-actions-ar.id
}

resource "azuread_service_principal" "github-actions-sp" {
  client_id    = azuread_application.github-actions-ar.client_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "github-actions-sp-secret" {
  service_principal_id = azuread_service_principal.github-actions-sp.id
}

resource "azurerm_role_assignment" "github-actions-sp-contributor" {
  scope              = "/subscriptions/cc6e154d-32c9-48dc-bd48-d293dc67a47c"
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.github-actions-sp.id
}