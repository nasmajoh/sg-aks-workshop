#!/usr/bin/env bash

# jn: prerequisite:
#  - setup_variables
#  - create_resourcegroup
#  - create_aks_vnet
#  - create_aks_firewall

echo "Run these manually first time!!!"
#exit

#Output:
#nasmajoh@sandbox  ~/sandbox/sg-aks-workshop/scripts   master ●✚  az ad sp create-for-rbac -n "${PREFIX}sp" --skip-assignment
#Changing "nasmanakssp" to a valid URI of "http://nasmanakssp", which is the required format used for service principal names
#{
#  "appId": "0837983d-afb2-4f94-9fe2-7466c2eab485",
#  "displayName": "nasmanakssp",
#  "name": "http://nasmanakssp",
#  "password": "OO7.nIN~MOvgQuQR4VIzXmxTz7MoDUhP2H",
#  "tenant": "f50a5f4d-54f0-44fe-926a-080ec32a8e93"
#}

# Create SP and Assign Permission to Virtual Network
# jn: az ad sp create-for-rbac -n "${PREFIX}sp" --skip-assignment
# ********************************************************************************
# Take the SP Creation output from above command and fill in Variables accordingly
# ********************************************************************************
export APPID="0837983d-afb2-4f94-9fe2-7466c2eab485" # jn:used in terraformvariables
export PASSWORD="OO7.nIN~MOvgQuQR4VIzXmxTz7MoDUhP2H" # jn: used in terraformvariables
VNETID=$(az network vnet show -g $RG --name $VNET_NAME --query id -o tsv)
# Assign SP Permission to VNET
az role assignment create --assignee $APPID --scope $VNETID --role Contributor
# View Role Assignment
az role assignment list --assignee $APPID --all -o table


#Output:
#The client 'john.nasman@cgi.com' with object id 'b5a8ea9f-4b52-479b-98f9-9ba5a8b0c4c0' does not have authorization
# to perform action 'Microsoft.Authorization/roleAssignments/write' over scope
# '/subscriptions/60c11ed1-0da5-4b07-b743-3c140d3b42a9/resourceGroups/nasmanaks-rg/providers/Microsoft.Network/virtualNetworks/nasmanaksvnet/providers/Microsoft.Authorization/roleAssignments/bbe08df4-4021-44e0-8a04-f7b5811dd9ab'
# or the scope is invalid. If access was recently granted, please refresh your credentials.
# --> tunnus oli jo contribuuttorina ?