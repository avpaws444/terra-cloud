#security group
resource "aws_security_group" "webserver_access" {
        name = "webserver_access"
        description = "allow ssh and http"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }


}

resource "aws_instance" "ourfirst" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.webserver_access.name}"]
  
  user_data = filebase64("install_httpd.sh")
  tags = {
    Name  = "ec2-test"
   
  }

}
