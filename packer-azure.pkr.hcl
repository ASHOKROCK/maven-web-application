packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

locals {
  extra_args = ["-vv",
    "-e", "ansible_fqdn=base",
    "-e", "env=${var.env}",
    "-e", "arch=${var.arch}",
    "--scp-extra-args", "'-O'",
  "-e", "packer=true", "-e", "azure=true"]
  timestamp    = regex_replace(timestamp(), "[- TZ:]", "")
  architecture = var.arch == "amd64" ? "x86_64" : "aarch64"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "arch" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "Standard_B1ms"
}

variable "region" {
  type    = string
  default = "East US"
}

source "azure-arm" "rocky" {
  azure_tags = {
    repo = "ap-common"
  }
  client_id                         = "d96d7648-a56d-4d9d-8bd8-17af65cbf556"
  client_secret                     = "QYM8Q~1s8HM0LKUwWQKSDuVjWY0SH_MqPYkeObW3"
  image_offer                       = "CentOS"
  image_publisher                   = "OpenLogic"
  image_sku                         = "7.3"
  location                          = var.region
  os_type                           = "Linux"
  subscription_id                   = "09b5b7f2-3c09-4648-87bd-6fda71dc4f2b"
  tenant_id                         = "a9f4b704-5abf-44ad-aa7a-81ac52764712"
  vm_size                           = var.instance_type
  ssh_username                      = "packer"
  ssh_password                      = "PackerP4sswordNotSecure@"
  ssh_pty                           = true
  managed_image_resource_group_name = "NEWAZRG"
  managed_image_name                = "base-${var.arch}-${local.timestamp}"

}

build {
  name = "packerimage"
  sources = [
    "source.azure-arm.rocky"
  ]

 /*
  provisioner "ansible" {
    command                 = "ansible-playbook"
    playbook_file           = "main.yml"
    user                    = "packer"
    inventory_file_template = "controller ansible_host={{ .Host }} ansible_user={{ .User }} ansible_port={{ .Port }}\n"
    extra_arguments         = local.extra_args
    #galaxy_file             = "requirements.yml"
  }


  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["/usr/sbin/waagent -force -deprovision+user &"]
    inline_shebang  = "/bin/sh -x"
  }
 */
}
