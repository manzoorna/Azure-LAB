variable "prefix" {
  description = "This prefix will be included in the name of most resources."
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "centralus"
}

variable "tags" {
  description = "Map of the tags to be applied"
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default     = "10.0.10.0/24"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_F2"
}

variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "2016-Datacenter"
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "Administrator user name for Windows Server"
  default     = "mladmin"
}

variable "admin_password" {
  description = "Administrator password for Windows Server"
  default     = "MondayGReen01!"
}

