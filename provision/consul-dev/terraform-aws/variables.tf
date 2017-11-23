variable "name"              { }
variable "vpc_cidrs_public"  { type = "list" }
variable "vpc_cidrs_private" { type = "list" }
variable "nat_count"         { }
variable "bastion_count"     { }
variable "consul_public_ip"  { }
variable "consul_count"      { }
variable "os"                { default = "RHEL" } # Base RHEL OS
variable "ami_owner"         { default = "309956199498" } # Base RHEL owner
variable "ami_name"          { default = "*RHEL-7.3_HVM_GA-*" } # Base RHEL name
variable "group"             { default = "consul" }
variable "user"              { default = "consul" }
variable "comment"           { default = "Consul" }
variable "home"              { default = "/srv/consul" }
variable "version"           { default = "1.0.1" }
variable "url"               { default = "" }
variable "image_id"          { default = "" }
