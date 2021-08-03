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


        Token                  = "my_token"
        DefaultReceiverUserId  = "13800138000"
        WechatWorkCorpId       = "ww741038v8sa88hv36d"
        WechatWorkCorpSecret   = "USVdvsa_ad2k34jk232kjn-asfefeawf_waeasdf-ase"
        WechatWorkAgentId      = "1000001"
        GrafanaWebhookUser     = "admin"
        GrafanaWebhookPassword = "admin"
      }

      driver = "podman"

      config {
        image = "80x86/wechat-work-message-push:latest"
        ports = ["http"]
      }
    }
  }
}
