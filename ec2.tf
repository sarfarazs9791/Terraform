resource "azurerm_resource_group" "RG1" {
  name     = "RG1"
  location = "West Europe"
}

resource "azurerm_virtual_network" "VN1" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  address_space       = ["10.0.0.0/16"]
  
 subnet {
    name           = "subnet1"
    address_prefix = "10.0.3.0/24"
  }
  

 tags = {
    environment = "Production"
  }
}


resource "azurerm_network_interface" "NI1" {
  name                = "nic1"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${azurerm_virtual_network.VN1.subnet.*.id[0]}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VM1" {
  name                = "windows-test"
  resource_group_name = azurerm_resource_group.RG1.name
  location            = azurerm_resource_group.RG1.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.NI1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}