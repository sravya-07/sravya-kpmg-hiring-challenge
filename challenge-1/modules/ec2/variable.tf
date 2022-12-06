variable "ami" { # the image that should be used for the ec2 
}

variable "instance_type" { # the instance type that should be used for the ec2 like t3.micro
}

variable "security_groups" { # the SGs that should be attached to the ec2
}

variable "subnet_id" { # the subnet in which the ec2 must be created
}

variable "tags" { # the tags that must be attached to the ec2
    default = null
}
