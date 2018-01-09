#!/bin/bash

#Install Ansible & azure
apk update
apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass jq go
pip install --upgrade pip
pip install azure-cli

#Set GO Path
export GOPATH=$HOME/go

#Install Webhook
go get github.com/adnanh/webhook

#Add my git email for dev
git config --global user.email "stjbrown@gmail.com"
