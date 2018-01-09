# webhook-server

Webhook Server for Azure Lab

### Get Started

`docker run -p 9000:9000 -p 2222:22 -it stjbrown/webhook-server`

### Add ENV
SP_PASSWORD=
AZURE_USERNAME=
AZURE_PW=

### Run hooks

/root/go/bin/webhook -hooks /root/hooks/hooks.json -verbose
