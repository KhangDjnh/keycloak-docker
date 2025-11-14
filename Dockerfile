# keycloak-docker/Dockerfile
FROM quay.io/keycloak/keycloak:25.0.6

# Chuyển sang user root để cài thêm nếu cần
USER root

# Cài font (nếu cần tiếng Việt)
RUN microdnf install -y fontconfig freetype && microdnf clean all

# Quay lại user keycloak
USER 1000

# Copy theme (nếu có sau này)
# COPY themes/ /opt/keycloak/themes/

# Start in dev mode (sẽ bị override bởi env)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]