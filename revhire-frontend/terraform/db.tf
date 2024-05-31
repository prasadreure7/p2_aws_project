resource "aws_db_instance" "example" {
  identifier = "demodb"
  db_name              = "revhire"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  
  db_subnet_group_name = aws_db_subnet_group.example.name

  username = var.rds_username
  port     = "3306"
  password = var.rds_password

  iam_database_authentication_enabled = true

  skip_final_snapshot = true
  
  vpc_security_group_ids = [aws_security_group.aws_rds_sg.id]
     tags = {
    Environment = "dev"
  }
}


resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "My database subnet group"
  }
}


output "rds_url" {
    value = aws_db_instance.example.endpoint
}

output "rds_db_name" {
    value = aws_db_instance.example.db_name
  
}

resource "aws_security_group" "aws_rds_sg" {
  name        = "aws_rds_sg"
  description = "Allow inbound traffic on port 3306"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
}