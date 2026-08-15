#!/bin/bash

create_report() {
    local url="$1"
    local domain="$2"
    local report="$3"

    {
        echo "========================================"
        echo "             ANTI-SPAM"
        echo "       SECURITY INVESTIGATION"
        echo "========================================"
        echo
        echo "Timestamp : $(date)"
        echo "URL       : $url"
        echo "Domain    : $domain"
        echo
        echo "========================================"
        echo
    } > "$report"

    echo "[+] Report initialized:"
    echo "$report"
}