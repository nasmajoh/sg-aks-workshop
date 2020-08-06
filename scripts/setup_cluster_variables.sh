#!/usr/bin/env bash

# Cluster provisioning - setup variables
# https://github.com/Azure/sg-aks-workshop/blob/master/cluster-provisioning/README.md

# jn: prerequisite:
#  - setup_variables
#  - create_resourcegroup
#  - create_aks_vnet
#  - create_aks_firewall
#  - create_aks_service_principal (manual step)
#  - create_public_ip

export TF_VAR_prefix=$PREFIX
export TF_VAR_resource_group=$RG
export TF_VAR_location=$LOC
export TF_VAR_client_id=$APPID
export TF_VAR_client_secret=$PASSWORD
export TF_VAR_azure_subnet_id=$(az network vnet subnet show -g $RG --vnet-name $VNET_NAME --name $AKSSUBNET_NAME --query id -o tsv)
export TF_VAR_azure_aag_subnet_id=$(az network vnet subnet show -g $RG --vnet-name $VNET_NAME --name $APPGWSUBNET_NAME --query id -o tsv)
export TF_VAR_azure_subnet_name=$APPGWSUBNET_NAME
export TF_VAR_azure_aag_name=$AGNAME
export TF_VAR_azure_aag_public_ip=$(az network public-ip show -g $RG -n $AGPUBLICIP_NAME --query id -o tsv)
export TF_VAR_azure_vnet_name=$VNET_NAME
export TF_VAR_github_organization=nasmajoh # PLEASE NOTE: This should be your github username if you forked the repository.
export TF_VAR_github_token=609a47534194f4c31d9c65c5311aee02cf4fb553 #<use previously created PAT token>
export TF_VAR_aad_server_app_id=0837983d-afb2-4f94-9fe2-7466c2eab485
export TF_VAR_aad_server_app_secret=OO7.nIN~MOvgQuQR4VIzXmxTz7MoDUhP2H
export TF_VAR_aad_client_app_id=0837983d-afb2-4f94-9fe2-7466c2eab485 #<ask_instructor> nasmanakssp AD app registrations
export TF_VAR_aad_tenant_id=f50a5f4d-54f0-44fe-926a-080ec32a8e93 #<ask_instructor>