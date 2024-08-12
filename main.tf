
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret
provider "azurerm" {
  features {} 
  client_id       = "a21a1093-ac4c-4b70-ae82-99a04fe71131"
  client_secret   = "buk8Q~TOo6sgJ4JxTQtsDIl.AUCxcpZ94CAVEaha"
  tenant_id       = "a9f4b704-5abf-44ad-aa7a-81ac52764712"
  subscription_id = "09b5b7f2-3c09-4648-87bd-6fda71dc4f2b"
}




resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "AZRGDEPLOY"
}

resource "azurerm_subnet" "mysubnet" {
  count                = 2
  name                 = "my-subnet-${count.index}"
  address_prefixes     = ["10.0.${count.index}.0/24"]
  virtual_network_name = azurerm_virtual_network.myvnet.name
  resource_group_name  = "AZRGDEPLOY"
}

resource "azurerm_network_interface" "mynic" {
  count               = 2  
  name                = "my-nic-${count.index}"
  location            = "eastus"
  resource_group_name = "AZRGDEPLOY"

  ip_configuration {
    name                          = "my-ip-config"
    subnet_id                     = azurerm_subnet.mysubnet[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "myvm" {
  count                = 2
  name                 = "my-vm-${count.index}"
  location             = "eastus"
  resource_group_name  = "AZRGDEPLOY"
  network_interface_ids = [azurerm_network_interface.mynic[count.index].id]
  vm_size              = "Standard_B1ms"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "my-os-disk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "my-vm-${count.index}"
    admin_username = "adminuser"
    admin_password = "AdminPassword123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
