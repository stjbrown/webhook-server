#!/bin/bash

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=

#Set Username to be created
SP_USERNAME=$1
SP_PASSWORD=$(uuidgen)


#Log into Azure and Output the SUbcription ID
AZURE_SUBSCRIPTION_ID=$(az login -u $AZURE_USERNAME -p $AZURE_PW | jq '.[0] .id' --raw-output)
AZURE_SUBSCRIPTION_ID="export AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID}"

#GET Tenat  ID
AZURE_TENANT=$(az account list | jq '.[0] .tenantId' --raw-output)
AZURE_TENANT="export AZURE_TENANT=${AZURE_TENANT}"

#Create new SP
AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $SP_USERNAME --password $SP_PASSWORD | jq '.appId' --raw-output)
echo $AZURE_CLIENT_ID >> /root/webhook-server/hooks/clientIDs.txt
AZURE_CLIENT_ID="export AZURE_CLIENT_ID=${AZURE_CLIENT_ID}"
AZURE_SECRET="export AZURE_SECRET=$SP_PASSWORD"


#Response sent to client
echo $AZURE_SUBSCRIPTION_ID
echo $AZURE_TENANT
echo $AZURE_CLIENT_ID
echo $AZURE_SECRET
