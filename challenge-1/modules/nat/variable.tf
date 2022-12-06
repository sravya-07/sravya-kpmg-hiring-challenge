variable "allocation_id" { # the value of EIP id that will be used by the NAT
}

variable "subnet_id" { # the subnet id for the NAT
}

variable "tags" { # the tags that will be attached to the NAT
    default = null
}