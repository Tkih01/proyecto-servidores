# Infraestructura Virtualizada - NexoComercial

Repositorio oficial de configuración, automatización, seguridad y evidencias para la infraestructura de laboratorio de **NexoComercial**.

## Arquitectura Consolidada (`SRV-CORE` - Debian Server)
* **Sistema Operativo y Archivos (`SRV-CORE`):** Gestión de grupos (`almacen`, `auditoria`), permisos SGID (`2770`), recursos compartidos en Samba y cola de impresión virtual en CUPS (`PDF`).
* **Base de Datos (`SRV-DB`):** MariaDB (`nexocomercial_db`) con modelo relacional de inventario (`usuarios`, `productos`, `movimientos`) y usuario de aplicación con mínimo privilegio (`app_nexo`).
* **Servidor Web (`SRV-WEB`):** Apache/2.4.69 (Debian) con VirtualHost `inventario.nexocomercial.test`.
* **Seguridad, Respaldo y Automatización:** Firewall UFW activo, respaldo lógico verificado (`backup.sh`), monitoreo (`diagnostico.sh`) y RTO validado en 54 segundos.

## Estructura del Repositorio
* `docs/`: Arquitectura, informe técnico, matriz de seguridad y plan de respaldo.
* `configs/`: Configuraciones de Apache, Samba, UFW y scripts SQL (`schema.sql`, `seed.sql`, `pruebas.sql`).
* `scripts/`: Scripts automatizados de respaldo (`backup.sh`) y diagnóstico (`diagnostico.sh`).
* `tests/`: Plan de pruebas y bitácoras de resultados.
* `evidence/`: Evidencias organizadas por módulo (`sistema`, `archivos_cups`, `database`, `web_correo`, `recovery`).
