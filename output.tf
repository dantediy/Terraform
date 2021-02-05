output "datacenter_id" {
  value = data.vsphere_datacenter.Datacenter.id
}

output "cluster_id" {
  value = data.vsphere_compute_cluster.Cluster.id
}

output "datastore_id" {
  value = data.vsphere_datastore.Datastore.id
}

#output "portgroup_id" {
#  value = data.vsphere_network.Network.id
#}