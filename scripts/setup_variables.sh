#!/usr/bin/env bash

## Variable Setup (jn: export all to make them accessable from other scripts)
export PREFIX="nasmanaks" # NOTE: Please make sure PREFIX is unique in your tenant, you must not have any hyphens '-' in the value.
export RG="${PREFIX}-rg"
export LOC="westeurope"
export NAME="${PREFIX}"
export ACR_NAME="${NAME}acr"
export VNET_NAME="${PREFIX}vnet"
export AKSSUBNET_NAME="${PREFIX}akssubnet"
export SVCSUBNET_NAME="nasmanakssvcsubnet"
export APPGWSUBNET_NAME="${PREFIX}appgwsubnet"
# NOTE: DO NOT CHANGE FWSUBNET_NAME - This is currently a requirement for Azure Firewall.
export FWSUBNET_NAME="AzureFirewallSubnet"
export FWNAME="${PREFIX}fw"
export FWPUBLICIP_NAME="${PREFIX}fwpublicip"
export FWIPCONFIG_NAME="${PREFIX}fwconfig"
export FWROUTE_TABLE_NAME="${PREFIX}fwrt"
export FWROUTE_NAME="${PREFIX}fwrn"
export AGNAME="${PREFIX}ag"
export AGPUBLICIP_NAME="${PREFIX}agpublicip"
