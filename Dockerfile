# Dockerfile
FROM quay.io/keycloak/keycloak:24.0

# Render usa PORT
ENV KC_HTTP_PORT=${PORT}

# Build de Keycloak (modo producción)
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/bin/sh", "-c"]

CMD "/opt/keycloak/bin/kc.sh start \
  --http-enabled=true \
  --http-port=${PORT} \
  --proxy-headers=xforwarded \
  --hostname-strict=false"
