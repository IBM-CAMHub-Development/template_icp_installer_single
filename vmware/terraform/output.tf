# Generate a random id to maintian output object uniqueness
resource "random_id" "clusterid" {
  byte_length = "2"
}

output "ibm_cloud_private_admin_url" {
  value = "https://${element(values(var.singlenode_hostname_ip),0)}:8443"
}

output "ibm_cloud_private_admin_user" {
  value = "${var.icp_admin_user}"
}

output "ibm_cloud_private_admin_password" {
  value = "${var.icp_admin_password}"
}

output "ibm_cloud_private_master_ip" {
  value = "${element(values(var.singlenode_hostname_ip),0)}"
}

output "ibm_cloud_private_proxy_hostname" {
  value = "${element(keys(var.singlenode_hostname_ip),0)}.${var.vm_domain}"
}

output "ibm_cloud_private_custer_ca_domain" {
	value = "${var.icp_cluster_name}.${var.vm_domain}"
}

output "cloud_connection_name"{
	value = "${var.icp_cluster_name}${random_id.clusterid.hex}Connection" 
}

output "kube_config_do_name"{
	value = "${var.icp_cluster_name}${random_id.clusterid.hex}KubeConfig" 
}

output "registry_config_do_name"{
	value = "${var.icp_cluster_name}${random_id.clusterid.hex}RegistryConfig" 
}

output "cluster_config"{
  value = "${module.icp_config_output.cluster_kube_config}"
}

output "cluster_ca_certificate"{
  value = "${module.icp_config_output.cluster_kube_config_ca_cert_data}"
}

output "registry_ca_cert"{
  value = "${module.icp_config_output.registry_ca_cert}"
}  

output "icp_install_dir"{
  value = "${camc_scriptpackage.get_home_dir.result["stdout"]}/ibm-cloud-private-x86_64-${var.icp_version}/cluster"
}