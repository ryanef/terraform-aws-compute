variable ami_most_recent {
    type = bool
    default = true
}

variable access_ip {
   type = list(string)
   description = "a list of IP addresses that can have access to AWS resources like EC2"
   default = ["75.177.148.116/32"]
}

variable "ami_owner" {
    type = list(string)
    default = ["099720109477"]
}
variable "ami_filter_name" {
    type = string
    default = "name"
}

variable "ami_filter_value"{
    type = list(string)
    default = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}
variable "instance_count" {
    default = 1
}
variable  "instance_type" {
    default = "t2.micro"
}
variable "associate_public_ip_address" {
    type = bool
    default = true
} 

variable "vol_size" {
    type = number
    default = 10
}

