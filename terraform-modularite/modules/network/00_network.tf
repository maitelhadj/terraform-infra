terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "~> 2.9.1"
    }
  }
  required_version = "~> 1.3.0"
}

resource "scaleway_vpc_private_network" "private_network" {
  name = "${var.prefix}-private-network"
}

resource "scaleway_instance_ip" "public_ip_app1" {}
resource "scaleway_instance_ip" "public_ip_ese1" {}
resource "scaleway_instance_ip" "public_ip_ese2" {}
resource "scaleway_instance_ip" "public_ip_ese3" {}

resource "scaleway_instance_security_group" "worker_sg" {
  name = "${var.prefix}-ese-security-group"
  inbound_default_policy  = "drop"

  inbound_rule {
    action = "accept"
    port   = var.port.ssh
  }
}

resource "scaleway_instance_security_group" "master_sg" {
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