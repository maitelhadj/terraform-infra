terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

resource "null_resource" "ese1" {
  triggers = {
    cluster_instance_ids = var.server_ese1_id
  }

  connection {
    host = var.public_ip_ese1
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = var.install_docker
  }
}

resource "null_resource" "ese2" {
  triggers = {
    cluster_instance_ids = var.server_ese2_id
  }

  connection {
    host = var.public_ip_ese2
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = var.install_docker
  }
}

resource "null_resource" "ese3" {
  triggers = {
    cluster_instance_ids = var.server_ese3_id
  }

  connection {
    host = var.public_ip_ese3
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = var.install_docker
  }
}

resource "null_resource" "app" {
  triggers = {
    cluster_instance_ids = var.server_app_id
  }

  connection {
    host = var.public_ip_app
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = var.install_docker
  }
}
