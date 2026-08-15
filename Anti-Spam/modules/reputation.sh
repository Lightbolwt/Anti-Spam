#!/bin/bash

reputation_check() {
    local url="$1"

    echo "[ REPUTATION SERVICES ]"
    echo
    echo "URL:"
    echo "$url"
    echo

    echo "VirusTotal:"
    echo "https://www.virustotal.com/gui/home/url"
    echo

    echo "Google Safe Browsing:"
    echo "https://transparencyreport.google.com/safe-browsing/search"
    echo

    echo "Cisco Talos:"
    echo "https://talosintelligence.com/reputation_center"
    echo

    echo "Cloudflare Abuse:"
    echo "https://abuse.cloudflare.com/"
    echo

    echo "ESET:"
    echo "https://phishing.eset.com/en-us/report/"

    echo "virustotal
    echo "https://www.virustotal.com/gui/home/url"
}