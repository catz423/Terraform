

variable "tags" {
  type = "map"
  description = "A map of the tags to use on the resources that are deployed with this module."
  default = {
    Division = "UFG"
    Environment = "DEV"
    Description = "OMS Development"
    ProductOwner = "IT Ops Cloud Team"
  }
}

