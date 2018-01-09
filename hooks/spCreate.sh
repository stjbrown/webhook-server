#!/bin/bash

#Required Enviroment Variables
#SP_PASSWORD=
#AZURE_USERNAME=
#AZURE_PW=

#Set Username to be created
SP_USERNAME=$1


#Log into Azure and Output the SUbcription ID
AZURE_SUBSCRIPTION_ID=$(az login -u $AZURE_USERNAME -p $AZURE_PW | jq '.[0] .id' --raw-output)
AZURE_SUBSCRIPTION_ID="export AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID}"

#GET Tenat  ID
AZURE_TENANT=$(az account list | jq '.[0] .tenantId' --raw-output)
AZURE_TENANT="export AZURE_TENANT=${AZURE_TENANT}"

#Create new SP
AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $SP_USERNAME --password $SP_PASSWORD | jq '.appId' --raw-output)
AZURE_CLIENT_ID="export AZURE_CLIENT_ID=${AZURE_CLIENT_ID}"
AZURE_SECRET="export AZURE_SECRET=$SP_PASSWORD"

#Echo Client ID to file
cat $AZURE_CLIENT_ID >> ~/webhook-server/scripts/clientIDs.txt

#Response sent to client
echo $AZURE_SUBSCRIPTION_ID
echo $AZURE_TENANT
echo $AZURE_CLIENT_ID
echo $AZURE_SECRET
