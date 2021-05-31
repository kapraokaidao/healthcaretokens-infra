# resource "aws_vpc" "healthcaretokens" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "healthcaretokens_private" {
#   vpc_id                  = aws_vpc.healthcaretokens.id
#   cidr_block              = "10.0.1.0/24"
# }

# resource "aws_subnet" "healthcaretokens_public" {
#   vpc_id                  = aws_vpc.healthcaretokens.id
#   cidr_block              = "10.0.2.0/24"
#   map_public_ip_on_launch = true
# }

# resource "aws_internet_gateway" "healthcaretokens" {
#   vpc_id = aws_vpc.healthcaretokens.id
# }

# resource "aws_route" "internet_access" {
#   route_table_id         = aws_vpc.healthcaretokens.main_route_table_id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.healthcaretokens.id
# }