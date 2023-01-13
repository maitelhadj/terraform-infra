terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

resource "null_resource" "provision" {
  triggers = {
    cluster_instance_ids = var.server_id
  }

  connection {
    host = var.public_ip
    private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = var.install_docker_script
  }
}
