data "aws_ami" "server_ami" {
  most_recent = var.ami_most_recent

  owners = var.ami_owner

  filter {
    name   = "name"
    values = var.ami_filter_value
  }
}

resource "random_shuffle" "subnet" {
  input        = module.vpc.public_subnets
  result_count = 1
}

resource "aws_instance" "this" {
  count = var.instance_count
  associate_public_ip_address = var.associate_public_ip_address 
  ami = data.aws_ami.server_ami.id

  instance_type = var.instance_type
  key_name = "saturday"
  subnet_id              = element(module.vpc.public_subnets, count.index)
  vpc_security_group_ids = [module.vpc.vpc_default_security_group]

  root_block_device {
    volume_size = var.vol_size
  }
}


