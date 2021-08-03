FROM alpine:latest

RUN apk update && apk add --no-cache ca-certificates tzdata

ADD https://curl.se/ca/cacert.pem /etc/ssl/certs/

ADD wechat-work-message-push-go /app/wechat-work-message-push-go

EXPOSE 80

ENV TOKEN my_token
ENV WECHATWORK_DEFAULT_RECEIVER_UID 13800138000
ENV WECHATWORK_CORP_ID ww741038v8sa88hv36d
ENV WECHATWORK_CORP_SECRET USVdvsa_ad2k34jk232kjn-asfefeawf_waeasdf-ase
ENV WECHATWORK_AGENT_ID 1000001
ENV GRAFANA_WEBHOOK_USER admin
ENV GRAFANA_WEBHOOK_PASSWORD admin

CMD ["/app/wechat-work-message-push-go"]