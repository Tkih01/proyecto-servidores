#!/usr/bin/env bash
set -u

REPORT="/var/log/nexo_diagnostico.log"
{
  echo "=== REPORTE DE DIAGNOSTICO NEXOCOMERCIAL ($(date -Is)) ==="
  echo "--- 1. ESTADO DE SERVICIOS ---"
  for srv in apache2 mariadb smbd cups ssh; do
    printf "%-10s: %s\n" "$srv" "$(systemctl is-active $srv 2>/dev/null || echo 'inactivo')"
  done
  echo "--- 2. USO DE DISCO Y MEMORIA ---"
  df -h / /srv /var
  free -m
  echo "--- 3. PUERTOS EN ESCUCHA ---"
  ss -tuln
  echo "--- 4. ULTIMOS REGISTROS DE ERROR ---"
  journalctl -p 3 -n 8 --no-pager
} | tee "$REPORT"
