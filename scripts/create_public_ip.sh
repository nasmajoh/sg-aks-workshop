#!/usr/bin/env bash

# jn: prerequisite:
#  - setup_variables
#  - create_resourcegroup
#  - create_aks_vnet
#  - create_aks_firewall
#  - create_aks_service_principal (manual step)

# Create Public IP for use with WAF (Azure Application Gateway)
az network public-ip create -g $RG -n $AGPUBLICIP_NAME -l $LOC --sku "Standard"

# Output:
#[Coming breaking change] In the coming release, the default behavior will be changed as follows when sku is
# Standard and zone is not provided: For zonal regions, you will get a zone-redundant IP indicated by
# zones:["1","2","3"]; For non-zonal regions, you will get a non zone-redundant IP indicated by zones:[].