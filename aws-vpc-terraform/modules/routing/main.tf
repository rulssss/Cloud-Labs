# IGW

resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc_id

    tags = {
        Name        = "${var.project}-${var.environment}-igw"
        Environment = var.environment
        Project     = var.project
        ManagedBy   = "terraform"
  }
}

# Public route table

resource "aws_route_table" "public" {
    vpc_id = var.vpc_id

    tags = {
        Name        = "${var.project}-${var.environment}-rt-public"
        Environment = var.environment
        Project     = var.project
        Type        = "public"
        ManagedBy   = "terraform"
  }
}

resource "aws_route" "public_internet" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

# Private route table

resource "aws_route_table" "private" {
    vpc_id = var.vpc_id

    tags = {
        Name        = "${var.project}-${var.environment}-rt-private"
        Environment = var.environment
        Project     = var.project
        Type        = "private"
        ManagedBy   = "terraform"
  }
}


# Association public

resource "aws_route_table_association" "public_1" {
    subnet_id = var.public_subnet_ids[0]
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = var.public_subnet_ids[1]
    route_table_id = aws_route_table.public.id
}

# Association private

resource "aws_route_table_association" "private_1" {
    subnet_id = var.private_subnet_ids[0]
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = var.private_subnet_ids[1]
    route_table_id = aws_route_table.private.id
}