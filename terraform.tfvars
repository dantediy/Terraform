# Provider
<<<<<<< HEAD
provider_vsphere_host = "vcenter.lab.local"
provider_vsphere_user = "administrator@vsphere.local"
provider_vsphere_password = "P@ss@@2021"
=======
provider_vsphere_host = "Vcenter IP or Domain"
provider_vsphere_user = "User ID"
provider_vsphere_password = "User pass"
>>>>>>> a4a9f384803ede7c377b12d208ada78b0921655a

# Infrastructure
deploy_vsphere_datacenter = "Datacenter"
deploy_vsphere_cluster = "Cluster"
deploy_vsphere_datastore = "Data store name"
#deploy_vsphere_folder = "/kubernetes"
<<<<<<< HEAD
deploy_vsphere_network = "PG-Mikrotik
=======
deploy_vsphere_network = "Network Name"
>>>>>>> a4a9f384803ede7c377b12d208ada78b0921655a

# Guest
guest_template = "packer-ubuntu-18.04-khoa"
guest_vcpu = "2"
guest_memory = "4096"
<<<<<<< HEAD
guest_ipv4_netmask = "24"
guest_ipv4_gateway = "10.1.1.254"
guest_dns_servers = "10.1.1.200"
=======
#guest_ipv4_netmask = "24"
guest_ipv4_gateway = "IP Gateway"
guest_dns_servers = "DNS"
>>>>>>> a4a9f384803ede7c377b12d208ada78b0921655a
#guest_dns_suffix = "pod03.lab.local"
guest_domain = "lab.local"
