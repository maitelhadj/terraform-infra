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