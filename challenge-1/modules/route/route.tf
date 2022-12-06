resource "aws_route" "route" { # module for creating a route (a route entry in a route table) 
  # (the route can be for various services like NAT, VPC endpoint etc.)
  # (a route entry in a route table is only for one service at once)
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block

  carrier_gateway_id        = var.conn_type == "carrier_gateway" ? var.conn_id : null
  core_network_arn          = var.conn_type == "core_network_arn" ? var.conn_id : null
  egress_only_gateway_id    = var.conn_type == "egress_only_gateway" ? var.conn_id : null
  gateway_id                = var.conn_type == "vpc_internet_gateway" ? var.conn_id : null
  network_interface_id      = var.conn_type == "instace" ? var.conn_id : null
  nat_gateway_id            = var.conn_type == "nat_gateway" ? var.conn_id : null
  local_gateway_id          = var.conn_type == "local_gateway" ? var.conn_id : null
  transit_gateway_id        = var.conn_type == "transit_gateway" ? var.conn_id : null
  vpc_endpoint_id           = var.conn_type == "vpc_endpoint" ? var.conn_id : null
  vpc_peering_connection_id = var.conn_type == "vpc_peering_connection" ? var.conn_id : null
}
