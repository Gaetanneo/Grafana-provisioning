FROM grafana/grafana:latest

ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_AUTH_ANONYMOUS_ORG_ROLE=Viewer
ENV GF_AUTH_BASIC_ENABLED=false
ENV GF_AUTH_DISABLE_LOGIN_FORM=true
ENV GF_AUTH_DISABLE_SIGNOUT_MENU=true
ENV GF_SECURITY_ALLOW_EMBEDDING=true
ENV GF_SERVER_SERVE_FROM_SUB_PATH=true
ENV GF_SERVE_FROM_SUB_PATH=true

EXPOSE 3000

ADD ./provisioning/datasources/datasource.yaml /etc/grafana/provisioning/datasources/datasource.yaml
ADD ./provisioning/dashboards/dashboards.yaml /etc/grafana/provisioning/dashboards/dashboards.yaml
ADD ./dashboards /var/lib/grafana/dashboards
ADD ./provioning/alerting/cluster-alertrule.yaml /etc/grafana/provisioning/alerting/cluster-alertrule.yaml
ADD ./provioning/alerting/contact-point.yaml /etc/grafana/provisioning/alerting/contact-point.yaml
ADD ./provisioning/alerting/notification-policies.yaml /etc/grafana/provisioning/alerting/notification-policies.yaml

#COPY ./provisioning/dashboards /etc/grafana/provisioning/dashboards
#COPY ./provisioning/datasources /etc/grafana/provisioning/datasources
#COPY ./dashboards /var/lib/grafana/dashboards

# CMD ["grafana-reporter"]
CMD ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]

