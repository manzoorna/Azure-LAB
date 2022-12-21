terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}
# terraform{
# cloud {
#     organization = "ML-Mumbai"
#     workspaces {
#       name = "ml-learn-terraform-azure"
#     }
#   }
# }

# terraform {
#   backend "local" {
#     path = "C:/Terraform-Azure/Test3/terraform.tfstate"
#   }
# }

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG-1" {
  name     = "${var.prefix}-RG"
  location = var.location
  tags     = var.tags
}

# resource "azurerm_virtual_network" "vnet" {
#   name                = "${var.prefix}-vnet"
#   location            = azurerm_resource_group.RG-1.location
#   address_space       = [var.address_space]
#   resource_group_name = azurerm_resource_group.RG-1.name
#   tags                = var.tags
# }

# resource "azurerm_subnet" "subnet" {
#   name                 = "${var.prefix}-subnet"
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   resource_group_name  = azurerm_resource_group.RG-1.name
#   address_prefixes     = [var.subnet_prefix]
# }

# resource "azurerm_network_security_group" "app-sg" {
#   name                = "${var.prefix}-sg"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.RG-1.name

#   security_rule {
#     name                       = "HTTP"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "HTTPS"
#     priority                   = 102
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "RDP"
#     priority                   = 101
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "3389"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface" "app-nic" {
#   name                = "${var.prefix}-app-nic"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.RG-1.name

#   ip_configuration {
#     name                          = "${var.prefix}ipconfig"
#     subnet_id                     = azurerm_subnet.subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.app-pip.id
#   }
#   tags = var.tags
# }

# resource "azurerm_network_interface_security_group_association" "app-nic-sg-ass" {
#   network_interface_id      = azurerm_network_interface.app-nic.id
#   network_security_group_id = azurerm_network_security_group.app-sg.id
# }

# resource "azurerm_public_ip" "app-pip" {
#   name                = "${var.prefix}-ip"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.RG-1.name
#   allocation_method   = "Dynamic"
#   tags                = var.tags
# }

# resource "azurerm_windows_virtual_machine" "app" {
#   name                  = "${var.prefix}-LAB"
#   location              = var.location
#   resource_group_name   = azurerm_resource_group.RG-1.name
#   size                  = var.vm_size
#   network_interface_ids = [azurerm_network_interface.app-nic.id]
#   admin_username        = var.admin_username
#   admin_password        = var.admin_password

#   os_disk {
#     name                 = "${var.prefix}-osdisk"
#     storage_account_type = "Standard_LRS"
#     caching              = "ReadWrite"
#   }
#   source_image_reference {
#     publisher = var.image_publisher
#     offer     = var.image_offer
#     sku       = var.image_sku
#     version   = var.image_version
#   }
#   tags = var.tags
# }