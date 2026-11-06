#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="/var/backups/nexocomercial"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DB_FILE="${BACKUP_DIR}/db_nexocomercial_${TIMESTAMP}.sql.gz"
CFG_FILE="${BACKUP_DIR}/configs_${TIMESTAMP}.tar.gz"
LOG_FILE="/var/log/nexo_backup.log"

mkdir -p "$BACKUP_DIR"
echo "[$(date -Is)] Iniciando respaldo..." | tee -a "$LOG_FILE"

# 1. Respaldo logico de base de datos y configuraciones criticas
mysqldump --single-transaction --routines --triggers nexocomercial_db | gzip > "$DB_FILE"
tar -czf "$CFG_FILE" /etc/apache2/sites-available /etc/samba/smb.conf 2>/dev/null

# 2. Verificacion de archivo generado e integridad gzip
if [[ -s "$DB_FILE" ]] && gzip -t "$DB_FILE" && [[ -s "$CFG_FILE" ]]; then
    SHA_HASH=$(sha256sum "$DB_FILE" | awk '{print $1}')
    echo "[$(date -Is)] EXITO: Respaldo completado. Archivo=${DB_FILE} SHA256=${SHA_HASH}" | tee -a "$LOG_FILE"
else
    echo "[$(date -Is)] ERROR: Fallo la validacion del respaldo." | tee -a "$LOG_FILE"
    exit 1
fi
