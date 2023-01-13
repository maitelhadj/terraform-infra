prefix = "MAYAS"

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

ssh_public_key_path = "/home/mayas/.ssh/id_ed25519.pub"
ssh_private_key_path = "/home/mayas/.ssh/id_ed25519"