### Provider
provider "vsphere" {
    user        = var.provider_vsphere_user
    password    = var.provider_vsphere_password
    vsphere_server = var.provider_vsphere_host

    # self-signed cert
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "Datacenter" {
    name = var.deploy_vsphere_datacenter
}

data "vsphere_datastore" "Datastore" {
    name = var.deploy_vsphere_datastore
    datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_compute_cluster" "Cluster" {
    name = var.deploy_vsphere_cluster
    datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_network" "Network" {
    name = var.deploy_vsphere_network
    datacenter_id = data.vsphere_datacenter.Datacenter.id
}

data "vsphere_virtual_machine" "Template" {
    name = var.guest_template
    datacenter_id = data.vsphere_datacenter.Datacenter.id
}

### Resources
# Clone a single Linux VM from a template
/*
resource "vsphere_virtual_machine" "rancher" {
    name = "khoa-rancher"
    resource_pool_id = data.vsphere_compute_cluster.Cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.Datastore.id
    #folder = var.deploy_vsphere_folder
    
    num_cpus = var.guest_vcpu
    memory = var.guest_memory
    guest_id = data.vsphere_virtual_machine.Template.guest_id

    scsi_type = data.vsphere_virtual_machine.Template.scsi_type

    network_interface {
        network_id = data.vsphere_network.Network.id
        adapter_type = data.vsphere_virtual_machine.Template.network_interface_types[0]
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.Template.disks[0].size
        eagerly_scrub = data.vsphere_virtual_machine.Template.disks[0].eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.Template.disks[0].thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.Template.id

        customize {
            linux_options {
                host_name = "khoa-rancher"
                domain = var.guest_domain
            }

            network_interface {}

            ipv4_gateway = var.guest_ipv4_gateway
            dns_server_list = [var.guest_dns_servers]
        }
    }
}
*/

# Clone One Vm from a template

resource "vsphere_virtual_machine" "kubernetes-master" {
    name = "khoak8s-master"
    resource_pool_id = data.vsphere_compute_cluster.Cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.Datastore.id
    #folder = var.deploy_vsphere_folder
    
    num_cpus = var.guest_vcpu
    memory = var.guest_memory
    guest_id = data.vsphere_virtual_machine.Template.guest_id

    scsi_type = data.vsphere_virtual_machine.Template.scsi_type

    network_interface {
        network_id = data.vsphere_network.Network.id
        adapter_type = data.vsphere_virtual_machine.Template.network_interface_types[0]
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.Template.disks[0].size
        eagerly_scrub = data.vsphere_virtual_machine.Template.disks[0].eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.Template.disks[0].thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.Template.id

        customize {
            linux_options {
                host_name = "khoak8s-master"
                domain = var.guest_domain
            }

            network_interface {}

            ipv4_gateway = var.guest_ipv4_gateway
            dns_server_list = [var.guest_dns_servers]
        }
    }
}

# Clone multiple Vms from a template

resource "vsphere_virtual_machine" "kubernetes-workers" {
    count = 2
    name = "khoak8s-worker0${count.index + 1}"
    #name = "Gitlab-Runner"
    resource_pool_id = data.vsphere_compute_cluster.Cluster.resource_pool_id
    datastore_id = data.vsphere_datastore.Datastore.id
    #folder = var.deploy_vsphere_folder

    num_cpus = var.guest_vcpu
    memory = var.guest_memory
    guest_id = data.vsphere_virtual_machine.Template.guest_id

    scsi_type = data.vsphere_virtual_machine.Template.scsi_type

    network_interface {
        network_id = data.vsphere_network.Network.id
        adapter_type = data.vsphere_virtual_machine.Template.network_interface_types[0]
    }

    disk {
        label = "disk0"
        size = data.vsphere_virtual_machine.Template.disks[0].size
        eagerly_scrub = data.vsphere_virtual_machine.Template.disks[0].eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.Template.disks[0].thin_provisioned
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.Template.id

        customize {
            linux_options {
                host_name = "khoak8s-worker0${count.index + 1}"
                #host_name = "Gitlab-Runner"
                domain = var.guest_domain
            }

            network_interface {}

            ipv4_gateway = var.guest_ipv4_gateway
            dns_server_list = [var.guest_dns_servers]
        }
    }
}