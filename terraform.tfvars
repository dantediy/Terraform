# Provider
provider_vsphere_host = "vcenter.lab.local"
provider_vsphere_user = "administrator@vsphere.local"
provider_vsphere_password = "P@ss@@2021"


# Infrastructure
deploy_vsphere_datacenter = "Datacenter"
deploy_vsphere_cluster = "Cluster"
deploy_vsphere_datastore = "Data store name"
#deploy_vsphere_folder = "/kubernetes"
deploy_vsphere_network = "PG-Mikrotik


# Guest
guest_template = "packer-ubuntu-18.04-khoa"
guest_vcpu = "2"
guest_memory = "4096"
guest_ipv4_netmask = "24"
guest_ipv4_gateway = "10.1.1.254"
guest_dns_servers = "10.1.1.200"
#guest_dns_suffix = "pod03.lab.local"
guest_domain = "lab.local"
