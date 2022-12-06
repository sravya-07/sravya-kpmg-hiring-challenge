variable "name" { # the name of the SG
}

variable "description" { # the description of the SG
}

variable "vpc_id" { # the vpc_id of the VPC where the SG is supposed to be created
}

variable "tags" { # the tags to be added to the SG
    default = null
}
