# Provider
provider_vsphere_host = "Vcenter IP or Domain"
provider_vsphere_user = "User ID"
provider_vsphere_password = "User pass"

# Infrastructure
deploy_vsphere_datacenter = "Datacenter"
deploy_vsphere_cluster = "Cluster"
deploy_vsphere_datastore = "Data store name"
#deploy_vsphere_folder = "/kubernetes"
deploy_vsphere_network = "Network Name"

# Guest
guest_template = "packer-ubuntu-18.04-gitlab"
guest_vcpu = "2"
guest_memory = "4096"
#guest_ipv4_netmask = "24"
guest_ipv4_gateway = "IP Gateway"
guest_dns_servers = "DNS"
#guest_dns_suffix = "pod03.lab.local"
guest_domain = "lab.local"
