variable "regions" {
  type = map(any)
}
variable "product" {
  default = "wakatech"
}
variable "environment" {
  type = any
}