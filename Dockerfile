FROM quay.io/keycloak/keycloak:24.0

# Ejecutaremos por shell para expandir ${PORT} y demás vars en runtime (Render)
ENTRYPOINT ["/bin/sh","-c"]

# Forzamos Postgres y le pasamos todo por CLI (no se guardan secretos en la imagen)
# --http-enabled=true: Render termina TLS, así que servimos HTTP dentro del contenedor
# --proxy-headers=xforwarded: respeta cabeceras del proxy
# --hostname-strict=false: evita fallos por hostname al inicio
# --health-enabled / --metrics-enabled: útiles para healthcheck/observabilidad
CMD ["exec /opt/keycloak/bin/kc.sh start \
  --db=${KC_DB:-postgres} \
  --db-url=${KC_DB_URL} \
  --db-username=${KC_DB_USERNAME} \
  --db-password=${KC_DB_PASSWORD} \
  --http-enabled=true \
  --http-port=${PORT} \
  --proxy-headers=xforwarded \
  --hostname-strict=false \
  --health-enabled=true \
  --metrics-enabled=true"]
