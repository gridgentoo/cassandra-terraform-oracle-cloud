# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE CASSANDRA CLUSTER
# ---------------------------------------------------------------------------------------------------------------------
module "cassandra" {
  source               = "../../"
  compartment_ocid     = "${var.compartment_ocid}"
  node_count           = "3"
  availability_domains = "${data.template_file.ad_names.*.rendered}"
  subnet_ocids         = "${oci_core_subnet.CassandraSubnet.*.id}"
  vcn_cidr             = "${oci_core_virtual_network.CassandraVCN.cidr_block}"
  image_ocid           = "${var.image_ocid[var.region]}"
  storage_port         = "${var.storage_port}"
  ssl_storage_port     = "${var.ssl_storage_port}"
  ssh_authorized_keys  = "${var.ssh_authorized_keys}"
  ssh_private_key      = "${var.ssh_private_key}"
}
