variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the first Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the first Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the first Subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the first Subnet"
  type        = list(string)
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_user_name" {
  description = "Admin username for the VM"
  type        = string
}

variable "ssh_key" {
  description = "Path to SSH public key file (relative to Terraform root)"
  type        = string
}

variable "nvnet_name" {
  description = "Name of the second Virtual Network"
  type        = string
}

variable "nvnet_address_space" {
  description = "Address space for the second Virtual Network"
  type        = string
}

variable "nsubnet_name" {
  description = "Name of the second Subnet"
  type        = string
}

variable "nsubnet_address_prefix" {
  description = "Address prefix of the second Subnet"
  type        = list(string)
}