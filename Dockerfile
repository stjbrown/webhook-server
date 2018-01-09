############################################################
# Dockerfile to build f5-super-netops enablement container
# Based on Alpine Linux, seasoned with tools and workflows
############################################################

# Start with an awesome, tiny Linux distro.
FROM f5devcentral/f5-super-netops-container:base

#Disable Auto Clone
ENV SNOPS_AUTOCLONE 0

#Install Libs
RUN apk update
RUN apk add gcc libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass jq go

#Install azure-cli
RUN pip install --upgrade pip
RUN pip install azure-cli

#Set GO Path
ENV GOPATH "/root/go"

#Install Webhook
RUN go get github.com/adnanh/webhook

#Add hooks
copy hooks /root
