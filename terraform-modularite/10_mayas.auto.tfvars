prefix = "MAYAS"

port = {
    grafana     = 3000
    kibana      = 5601
    prometheus  = 9090
    ssh         = 22
}

ssh_public_key_path = "/home/mayas/.ssh/id_ed25519.pub"
ssh_private_key_path = "/home/mayas/.ssh/id_ed25519"

instances = {
    app = {
        name  = "app"
        type  = "DEV1-XL"
        image = "ubuntu_focal"
    },
    ese1 = {
        name  = "ese-1"
        type  = "DEV1-S"
        image = "ubuntu_focal"
    },
    ese2 = {
        name  = "ese-2"
        type  = "DEV1-S"
        image = "ubuntu_focal"
    },
    ese3 = {
        name  = "ese-3"
        type  = "DEV1-S"
        image = "ubuntu_focal"
    }
}

install_docker_script = [
    "curl -fsSL https://get.docker.com -o get-docker.sh",
    "sh get-docker.sh",
    "rm get-docker.sh"
]