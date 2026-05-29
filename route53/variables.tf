variable "regions" {
  type = map(any)
}
variable "workspaces" {
  type = list(any)
}
variable "local_dns_zone_name" {
  type = string
}
variable "public_dns_zone_name" {
  type = string
}
variable "public_dns_records" {
  type = any
}