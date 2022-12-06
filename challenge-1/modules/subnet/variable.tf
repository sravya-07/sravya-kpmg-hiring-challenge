variable "vpc_id" { # the ID of the VPC
}

variable "availability_zone" { # the availability zone in which the subnet has to be created
}

variable "cidr_block" { # the CIDR block of the subnet
}

variable "tags" { # the tags of the subnet
    default = null
}
