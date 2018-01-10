#!/bin/bash
WEBHOOK="/root/go/bin/webhook"
HOOK="/root/webhook-server/hooks/hooks.json"
KEY="/root/webhook-server/ssl/key.pem"
CERT="/root/webhook-server/ssl/cert.pem"

$WEBHOOK -hooks $HOOK  -secure -key $KEY  -cert $CERT  -verbose
