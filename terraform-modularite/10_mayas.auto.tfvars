prefix = "MAYAS"

instance = {
    app = {
        image = "ubuntu_focal"
        type  = "DEV1-XL"
    }
    ese = {
        image = "ubuntu_focal"
        type  = "DEV1-S"
    }
}

port = {
    grafana     = 3000
    kibana      = 5601
    prometheus  = 9090
    ssh         = 22
}

install_docker_script = [
    "curl -fsSL https://get.docker.com -o get-docker.sh",
    "sh get-docker.sh",
    "rm get-docker.sh"
]

ssh_public_key = file("/home/mayas/.ssh/id_ed25519.pub")
ssh_private_key = file("/home/mayas/.ssh/id_ed25519")