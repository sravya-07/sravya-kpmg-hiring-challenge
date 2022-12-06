variable "type" { # type of the rule "ingress" (inbound) or "egress" (outbound)
}

variable "from_port" { # the port from which the request will be made
}

variable "to_port" { # the port to which the request will be made
}

variable "protocol" { # the protocol of the request
}

variable "cidr_blocks" { # associated CIDR blocks
}

variable "ipv6_cidr_blocks" { # associated IPV6 CIDR blocks IF any
  default = null
}

variable "security_group_id" { # the security group ID for the rule
}
