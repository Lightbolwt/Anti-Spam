#!/bin/bash

dns_check() {
    local domain="$1"

    echo "[ DNS INFORMATION ]"
    echo "Domain: $domain"
    echo

    if command -v dig >/dev/null 2>&1; then
        echo "A records:"
        dig +short "$domain" A

        echo
        echo "AAAA records:"
        dig +short "$domain" AAAA

        echo
        echo "CNAME:"
        dig +short "$domain" CNAME

        echo
        echo "Nameservers:"
        dig +short "$domain" NS
    else
        echo "[!] dig is not installed."
    fi
}