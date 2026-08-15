#!/bin/bash

set -u

VERSION="1.0.0"

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
MODULE_DIR="$BASE_DIR/modules"
REPORT_DIR="$BASE_DIR/reports"

mkdir -p "$REPORT_DIR"

source "$MODULE_DIR/dns.sh"
source "$MODULE_DIR/http.sh"
source "$MODULE_DIR/reputation.sh"
source "$MODULE_DIR/report.sh"

clear

echo "========================================"
echo "              ANTI-SPAM"
echo "     Defensive Security Investigation"
echo "              v$VERSION"
echo "========================================"
echo

read -rp "Enter URL: " URL

if [[ -z "$URL" ]]; then
    echo "[!] No URL entered."
    exit 1
fi

DOMAIN=$(printf '%s\n' "$URL" |
    sed -E 's#^[a-zA-Z]+://##' |
    cut -d/ -f1 |
    cut -d: -f1)

TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
REPORT="$REPORT_DIR/report-$TIMESTAMP.txt"

create_report "$URL" "$DOMAIN" "$REPORT"

echo
echo "Running DNS investigation..."
echo "============================"

{
    dns_check "$DOMAIN"
} | tee -a "$REPORT"

echo
echo "Running HTTP investigation..."
echo "============================="

{
    http_check "$URL"
} | tee -a "$REPORT"

echo
echo "Checking reputation services..."
echo "================================"

{
    reputation_check "$URL"
} | tee -a "$REPORT"

echo
echo "========================================"
echo " Investigation complete"
echo "========================================"
echo
echo "Report:"
echo "$REPORT"