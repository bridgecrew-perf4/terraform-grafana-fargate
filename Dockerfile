FROM grafana/grafana

ARG GRAFANA_VERSION=latest
ARG GF_INSTALL_IMAGE_RENDERER_PLUGIN=true

# Uncomment the below to reset the password.
# CMD [ "admin", "reset-admin-password", "T3mpPasswdGoesHere!" ]
# ENTRYPOINT [ "/usr/share/grafana/bin/grafana-cli" ]