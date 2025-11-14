# Keycloak Docker Image

Dockerfile này dùng để tạo một image Keycloak tùy chỉnh dựa trên image chính thức `quay.io/keycloak/keycloak:25.0.6`.

Image này bổ sung các tính năng sau:

- Cài đặt font system để hỗ trợ tiếng Việt.
- Cho phép copy theme tùy chỉnh vào Keycloak.
- Khởi động Keycloak ở chế độ phát triển (dev mode) mặc định.

---

## Dockerfile

```dockerfile
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
