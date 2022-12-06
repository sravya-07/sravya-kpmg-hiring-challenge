variable "allocated_storage" { # the allocated_storage of the db
}

variable "db_name" { # the name of the database
}

variable "engine" { # the engine of the database like MySQL etc
}

variable "engine_version" { # the version of the engine used like 13.6
}

variable "instance_class" { # the instance class of the db 
}

variable "username" { # login username of the database
}

variable "password" { # login password of the database
}

variable "parameter_group_name" { # the parameter group name
}

variable "skip_final_snapshot" { # if the final snapshot should be skipped when db is deleted
}

variable "tags" { # tags to be attched to the database
    default = null
}

variable "db_subnet_group_name" { # the name of the database subnet group
}

variable "subnet_ids" { # the subnet ids in the db_subnet_group_name
}
