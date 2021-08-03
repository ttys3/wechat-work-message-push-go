package config

import (
	"os"
	"testing"
)

func TestConfig(t *testing.T) {
	os.Setenv("TOKEN", "my_token")
	os.Setenv("WECHATWORK_DEFAULT_RECEIVER_UID", "13800138000")
	os.Setenv("WECHATWORK_CORP_ID", "ww741038v8sa88hv36d")
	os.Setenv("WECHATWORK_CORP_SECRET", "USVdvsa_ad2k34jk232kjn-asfefeawf_waeasdf-ase")
	os.Setenv("WECHATWORK_AGENT_ID", "1000001")
	os.Setenv("GRAFANA_WEBHOOK_USER", "admin")
	os.Setenv("GRAFANA_WEBHOOK_PASSWORD", "admin")

	if err := LoadConfig(); err != nil {
		t.Fatal(err)
	}
	t.Logf("got config from env var=%+v", Config)

	if Config.Token != "my_token" {
		t.FailNow()
	}
}