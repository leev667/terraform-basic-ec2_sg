# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Semiramis VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["185.92.122.211/32"]
  }

  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-ssh"
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Semiramis VPC Web"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}

# Create Security Group - Redis
resource "aws_security_group" "vpc-redis" {
  name	      = "vpc-redis"
  description = "Semiramis VPC Redis"
  ingress {
    description = "Allow Port 6379"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["185.92.122.211/32"]
   }

   tags = {
     Name = "vpc-redis"
   }
}
