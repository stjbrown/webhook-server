#!/bin/bash

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=

#Log into Azure and Output the SUbcription ID
AZURE_SUBSCRIPTION_ID=$(az login -u $AZURE_USERNAME -p $AZURE_PW)

for ID in $(cat /root/webhook-server/hooks/clientIDs.txt); 
do 
echo "Deleteing $ID"
az ad sp delete --id $ID
done

    #az ad delete --id $ID
