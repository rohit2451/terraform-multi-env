variable "instances" {
    type = map

}

variable "zone_id" {
  default = "Z00005131VQATFYLWL9ZL"
}

variable "domain_name" {
  default = "rohired.online"
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "tags" {
    type = map
}

variable "environment" {
  
}