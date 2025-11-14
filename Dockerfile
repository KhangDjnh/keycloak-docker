FROM quay.io/keycloak/keycloak:25.0.6

USER root
RUN microdnf install -y fontconfig freetype && microdnf clean all
USER 1000

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]