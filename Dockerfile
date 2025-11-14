FROM quay.io/keycloak/keycloak:25.0.6

USER root

# Cài font
RUN dnf install -y fontconfig freetype && dnf clean all

USER 1000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
