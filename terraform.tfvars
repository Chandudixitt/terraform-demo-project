resource_group_name          = "manageddemorglatest"
location                     = "East US"
vnet_name                    = "managed-demo-vnet-terralatest"
vnet_address_space           = ["10.0.0.0/18"]
subnet_bastion_name          = "bastion-sub"
subnet_bastion_address_prefix= "10.0.0.0/24"
storage_account_name         = "managedsa2demo"
storage_container_names      = ["manageddemocontainer", "manageddemosastoragecont", "manageddemosastoragecontainer"]
