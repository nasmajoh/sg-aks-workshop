#!/usr/bin/env bash

## Cluster Pre-Provisioning
## https://github.com/Azure/sg-aks-workshop/blob/master/cluster-pre-provisioning/README.md

## login to Azure first without diplaying passwd/ jn 5.8.2020
## read -sp "Azure password: " AZ_PASS && echo && az login -u <username> -p $AZ_PASS
##

#### Create Resource Group
# Get ARM Access Token and Subscription ID - This will be used for AuthN later.
ACCESS_TOKEN=$(az account get-access-token -o tsv --query 'accessToken')
# NOTE: Update Subscription Name
# Use list command to get list of Subscription IDs & Names
az account list -o table
# Set Default Azure Subscription to be Used via Subscription ID
az account set -s 60c11ed1-0da5-4b07-b743-3c140d3b42a9 # CGI FI-000000000042904-Yhtiotason tyot <SUBSCRIPTION_ID_GOES_HERE>
# Put Subsc
SUBID=$(az account show -s 'FI-000000000042904-Yhtiötason työt' -o tsv --query 'id') # 60c11ed1-0da5-4b07-b743-3c140d3b42a9
# Create Resource Group
az group create --name $RG --location $LOC