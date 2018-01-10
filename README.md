# webhook-server

Webhook Server for Azure Lab

### Get Started

`docker run -p 9000:9000 -p 2222:22 -it stjbrown/webhook-server`

### Required ENV Variables
```
SP_PASSWORD=
AZURE_USERNAME=
AZURE_PW=
```
### Edit hook tokens
```
cd /root/webhook-server/hooks
vi hooks.json
```

Each hook will have a snippet of JSON for the trigger. This is where the authentication token is stored. Modify this before use.

```javascript
    "trigger-rule":
    {
      "match":
      {
        "type": "value",
        "value": "ChangeThisValue",
        "parameter":
        {
          "source": "url",
          "name": "token"
        }
      }
    }
```


### Run hooks
```
cd /root/webhook-server
./startWebhook.sh
