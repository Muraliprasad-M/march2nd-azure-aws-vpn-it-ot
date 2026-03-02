
resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = local.tgw_id
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-tgw-rt"
  })
}

resource "aws_ec2_transit_gateway_route_table_association" "vpc_assoc" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "vpc_prop" {
  count                          = var.propagate_vpc_attachment ? 1 : 0
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
}
