variable "route_table_id" { # the id of the route table for the entry
}

variable "destination_cidr_block" { # the destination cidr block for the route
}

variable "conn_type" { # the service type for the route entry
    default = "igw"
}

variable "conn_id" { # the id of the service in the route
}
