# keycloak-docker/Dockerfile
FROM quay.io/keycloak/keycloak:25.0.6

# Cài font tiếng Việt (nếu cần)
USER root
RUN dnf install -y fontconfig freetype && dnf clean all

# Quay lại user keycloak (an toàn)
USER 1000

# Chạy Keycloak đúng cách
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]