
resource "azurerm_public_ip" "PI1" {
  name                = var.PubIP[0]
  location            = var.region[0]
  resource_group_name = azurerm_resource_group.RG1.name
  allocation_method   = "Static"
}
resource "azurerm_public_ip" "PI2" {
  name                = var.PubIP[1]
  location            = var.region[1]
  resource_group_name = azurerm_resource_group.RG1.name
  allocation_method   = "Static"
}
resource "azurerm_lb" "LB1" {
  name                = var.LBname[0]
  location            = var.region[0]
  resource_group_name = azurerm_resource_group.RG1.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PI1.id
  }
}
resource "azurerm_lb" "LB2" {
  name                = var.LBname[1]
  location            = var.region[1]
  resource_group_name = azurerm_resource_group.RG1.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PI2.id
  }
}