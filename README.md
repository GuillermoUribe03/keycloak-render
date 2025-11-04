# Keycloak on Render

Imagen mínima para Keycloak (24.0).  
Se configura todo con variables de entorno en Render:

- KC_DB=postgres  
- KC_DB_URL=jdbc:postgresql://.../keycloak?sslmode=require&channelBinding=require  
- KC_DB_USERNAME=keycloak_user  
- KC_DB_PASSWORD=********  
- KEYCLOAK_ADMIN=admin-couriersync  
- KEYCLOAK_ADMIN_PASSWORD=********  
- JAVA_OPTS=-Dquarkus.transaction-manager.enable-recovery=true  
- (opcional) KC_HOSTNAME=https://<tu-servicio>.onrender.com
