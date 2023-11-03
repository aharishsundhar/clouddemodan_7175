# please obtain the variables below from your atlas account
variable "public_key" {
  description = "Mongo Atlas Public Key"
  default     = ""
}
variable "private_key" {
  description = "Mongo Atlas Private Key"
  default = ""
}
variable "project" {
    description = "Project name or add the your own project name"
    default = "clouddemodan_7175"
}
variable "orgid" {
  description = "Organization ID"
  default = ""
}
variable "dbusername" {
  description = "Database Username"
  default = ""
}
variable "dbpassword" {
  description = "Database User Password"
  default = ""
}
variable "clustername" {
  description = "Database Name"
  default = ""
}
