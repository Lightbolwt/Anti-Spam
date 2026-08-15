#!/bin/bash

http_check() {
    local url="$1"

    echo "[ HTTP INFORMATION ]"
    echo "URL: $url"
    echo

    curl -sS -I -L \
        --max-time 15 \
        --connect-timeout 5 \
        "$url" 2>&1

    echo
    echo "[ SECURITY HEADERS ]"

    curl -sS -I -L \
        --max-time 15 \
        "$url" 2>/dev/null |
    grep -Ei \
        '^(server:|content-type:|content-length:|location:|strict-transport-security:|content-security-policy:|x-content-type-options:|x-frame-options:)' ||
        echo "No selected security headers found."
}