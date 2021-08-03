job "wecom-push" {
  datacenters = ["dc1"]

  group "alert" {
    count = 1

    network {
      dns {
        servers = ["192.168.8.123", "8.8.8.8", "8.8.4.4"]
      }

      port "http" {
        # Alertmanager's default port is 9093
        static = 9094
        to     = 80
      }
    }

    service {
      name = "wecom-push"
      port = "http"

      check {
        type     = "tcp"
        port     = "http"
        interval = "60s"
        timeout  = "3s"
      }
    }

    task "wecom-push" {
      env {
        PORT    = "${NOMAD_PORT_http}"
        NODE_IP = "${NOMAD_IP_http}"

        TOKEN                           = "my_token"
        WECHATWORK_DEFAULT_RECEIVER_UID = "13800138000"
        WECHATWORK_CORP_ID              = "ww741038v8sa88hv36d"
        WECHATWORK_CORP_SECRET          = "USVdvsa_ad2k34jk232kjn-asfefeawf_waeasdf-ase"
        WECHATWORK_AGENT_ID             = "1000001"
        GRAFANA_WEBHOOK_USER            = "admin"
        GRAFANA_WEBHOOK_PASSWORD        = "admin"
      }

      driver = "podman"

      config {
        image = "80x86/wechat-work-message-push:latest"
        ports = ["http"]
      }
    }
  }
}
