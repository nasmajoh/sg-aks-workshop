#!/usr/bin/env bash

# jn: prerequisite: setup_variables, create_resourcegroup

# Create Virtual Network & Subnets for AKS, k8s Services, ACI, Firewall and WAF
az network vnet create \
    --resource-group $RG \
    --name $VNET_NAME \
    --address-prefixes 100.64.0.0/16 \
    --subnet-name $AKSSUBNET_NAME \
    --subnet-prefix 100.64.1.0/24
az network vnet subnet create \
    --resource-group $RG \
    --vnet-name $VNET_NAME \
    --name $SVCSUBNET_NAME \
    --address-prefix 100.64.2.0/24
az network vnet subnet create \
    --resource-group $RG \
    --vnet-name $VNET_NAME \
    --name $APPGWSUBNET_NAME \
    --address-prefix 100.64.3.0/26
az network vnet subnet create \
    --resource-group $RG \
    --vnet-name $VNET_NAME \
    --name $FWSUBNET_NAME \
    --address-prefix 100.64.4.0/26