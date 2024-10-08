

resource "aws_instance" "terraform" {

  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids=[aws_security_group.allow_ssh_terraform.id]
  tags = var.tags

}


resource "aws_security_group" "allow_ssh_terraform" {
  description = var.sg_description
  name   = var.sg_name
 

  # usually everything allow egress
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr #allow from every one
    ipv6_cidr_blocks = ["::/0"]
  }

  #ami-09c813fb71547fc4f
  tags = var.tags
}
