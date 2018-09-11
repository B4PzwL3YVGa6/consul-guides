output "zREADME" {
  value = <<README

Your "${var.name}" AWS Consul dev cluster has been
successfully provisioned!

${module.network_aws.zREADME}
To force the generation of a new key, the private key instance can be
"tainted" using the below command.

  $ terraform taint -module=ssh_keypair_aws_override.tls_private_key \
      tls_private_key.key

# ------------------------------------------------------------------------------
# External Cluster Access
# ------------------------------------------------------------------------------

If you'd like to interact with your cluster externally, use one of the below
options.

The `consul_public` variable must be set to true to access the cluster outside
of the bastion host.

`consul_public`: ${var.consul_public}

Below are the list of CIDRs that are whitelisted to have external access. This
list is populated from the "public_cidrs" variable merged with the external cidr
of the local workstation running Terraform for ease of use. If your CIDR does not
appear in the list, you can find it by googling "What is my ip" and add it to the
"public_cidrs" Terraform variable.

`public_cidrs`:
  ${join("\n  ", compact(concat(list(local.workstation_external_cidr), var.public_cidrs)))}

1.) Use Wetty (Web + tty), a web terminal for the cluster over HTTP and HTTPS

  Wetty Url: ${format("http://%s:3030/wetty", module.consul_aws.consul_app_lb_dns)}
  Wetty Username: wetty-${var.name}
  Wetty Password: ${element(concat(random_string.wetty_password.*.result, list("")), 0)}

2.) Set the below env var(s) and use Consul's CLI or HTTP API

  ${format("export CONSUL_ADDR=http://%s:8500", module.consul_aws.consul_app_lb_dns)}
  ${format("export CONSUL_HTTP_ADDR=http://%s:8500", module.consul_aws.consul_app_lb_dns)}

# ------------------------------------------------------------------------------
# Consul Dev
# ------------------------------------------------------------------------------

If public, you can SSH into the Consul nodes directly through the LB.

  $ ${format("ssh -A -i %s \\\n      %s@%s", module.ssh_keypair_aws_override.private_key_filename, module.consul_aws.consul_username, module.consul_aws.consul_network_lb_dns)}

${module.consul_aws.zREADME}
README
}

output "vpc_cidr" {
  value = "${module.network_aws.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.network_aws.vpc_id}"
}

output "subnet_public_ids" {
  value = "${module.network_aws.subnet_public_ids}"
}

output "subnet_private_ids" {
  value = "${module.network_aws.subnet_private_ids}"
}

output "bastion_sg_id" {
  value = "${module.network_aws.bastion_sg_id}"
}

output "private_key_name" {
  value = "${module.ssh_keypair_aws_override.private_key_name}"
}

output "private_key_filename" {
  value = "${module.ssh_keypair_aws_override.private_key_filename}"
}

output "private_key_pem" {
  value = "${module.ssh_keypair_aws_override.private_key_pem}"
}

output "public_key_pem" {
  value = "${module.ssh_keypair_aws_override.public_key_pem}"
}

output "public_key_openssh" {
  value = "${module.ssh_keypair_aws_override.public_key_openssh}"
}

output "ssh_key_name" {
  value = "${module.ssh_keypair_aws_override.name}"
}

output "consul_asg_id" {
  value = "${module.consul_aws.consul_asg_id}"
}

output "consul_sg_id" {
  value = "${module.consul_aws.consul_sg_id}"
}

output "consul_app_lb_sg_id" {
  value = "${module.consul_aws.consul_app_lb_sg_id}"
}

output "consul_lb_arn" {
  value = "${module.consul_aws.consul_lb_arn}"
}

output "consul_app_lb_dns" {
  value = "${module.consul_aws.consul_app_lb_dns}"
}

output "consul_network_lb_dns" {
  value = "${module.consul_aws.consul_network_lb_dns}"
}

output "consul_tg_tcp_22_arn" {
  value = "${module.consul_aws.consul_tg_tcp_22_arn}"
}

output "consul_tg_tcp_8500_arn" {
  value = "${module.consul_aws.consul_tg_tcp_8500_arn}"
}

output "consul_tg_http_8500_arn" {
  value = "${module.consul_aws.consul_tg_http_8500_arn}"
}

output "consul_tg_tcp_8080_arn" {
  value = "${module.consul_aws.consul_tg_tcp_8080_arn}"
}

output "consul_tg_https_8080_arn" {
  value = "${module.consul_aws.consul_tg_https_8080_arn}"
}

output "consul_tg_http_3030_arn" {
  value = "${module.consul_aws.consul_tg_http_3030_arn}"
}

output "consul_tg_https_3030_arn" {
  value = "${module.consul_aws.consul_tg_https_3030_arn}"
}
