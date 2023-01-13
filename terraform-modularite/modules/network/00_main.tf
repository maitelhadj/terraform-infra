terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

resource "scaleway_account_ssh_key" "ssh" {
  name = "ssh_key"
  public_key = var.ssh_public_key
}

resource "scaleway_vpc_private_network" "private_network" {
  name = "${var.prefix}-private-network"
}

resource "scaleway_instance_security_group" "ese_sg" {
  name = "${var.prefix}-ese-security-group"
  inbound_default_policy  = "drop"

  inbound_rule {
    action = "accept"
    port   = var.port.ssh
  }
}

resource "scaleway_instance_security_group" "app_sg" {
  name = "${var.prefix}-app-security-group"
  inbound_default_policy  = "drop"

  inbound_rule {
    action = "accept"
    port   = var.port.ssh
  }

  inbound_rule {
    action = "accept"
    port   = var.port.grafana
  }

  inbound_rule {
    action = "accept"
    port   = var.port.kibana
  }
  
  inbound_rule {
    action = "accept"
    port   = var.port.prometheus
  }
}