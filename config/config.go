package config

import (
	"fmt"
	"github.com/kelseyhightower/envconfig"
)

type config struct {
	Token      string  `envconfig:"TOKEN"`
	WechatWork struct {
		DefaultReceiverUserId string `envconfig:"WECHATWORK_DEFAULT_RECEIVER_UID"`
		CorpId                string `envconfig:"WECHATWORK_CORP_ID"`
		CorpSecret            string `envconfig:"WECHATWORK_CORP_SECRET"`
		AgentId               string `envconfig:"WECHATWORK_AGENT_ID"`
	}
	GrafanaWebhookUser     string `envconfig:"GRAFANA_WEBHOOK_USER"`
	GrafanaWebhookPassword string `envconfig:"GRAFANA_WEBHOOK_PASSWORD"`
}

var Config config

func LoadConfig() (err error) {
	err = envconfig.Process("", &Config)
	if err != nil {
		return
	}
	fmt.Printf("config=%+v\n", Config)
	return err
}
