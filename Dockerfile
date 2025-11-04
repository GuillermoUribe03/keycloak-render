# Dockerfile
FROM quay.io/keycloak/keycloak:24.0

# Render inyecta el puerto en la var PORT
# Usamos 'start' (modo prod) y activamos cabeceras del proxy
ENTRYPOINT ["/bin/sh", "-c"]

CMD "/opt/keycloak/bin/kc.sh start \
  --http-port=${PORT} \
  --proxy-headers=xforwarded \
  --hostname-strict=false"
