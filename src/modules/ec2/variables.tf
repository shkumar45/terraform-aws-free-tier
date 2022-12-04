variable "ec2_should_be_created" {
  description = "Should the EC2 be created?"
  type        = bool
  default     = true
}

variable "ec2_instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

# EBS - BEGIN
variable "ec2_ebs_vol_size" {
  description = "EBS Volume Size"
  type        = number
  default     = 10
}

variable "ec2_ebs_availability_zone" {
  description = "The Availability Zone of EBS Volume"
  type        = string
  default     = "us-west-1b"
}
variable "ec2_ebs_vol_name" {
  description = "The Name of the EC2 EBS Volume"
  type        = string
  default     = "Free Tier EC2 EBS Vol"
}
variable "ec2_device_names" {
  description = "The Name of the EC2 device"
  #  type        = array
  default = [
    "/dev/sdf",
    "/dev/sdg",
    "/dev/sdh",
    "/dev/sdi",
    "/dev/sdj"
  ]
}

# EBS - END

variable "ec2_name" {
  description = "The Name of the EC2"
  type        = string
  default     = "Free Tier EC2"
}

variable "ec2_security_group_name" {
  description = "The Name of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ec2_security_group_description" {
  description = "The Description of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ec2_ami" {
  description = "The Amazon Machine Image"
  type        = string
  default     = "ami-03f6d497fceb40069" //"ami-04b9e92b5572fa0d1" # Ubuntu 18.04 LTS (64-bit x86)  Free Tier eligible
}

variable "ec2_instance_type" {
  description = "The EC2 Instance type"
  type        = string
  default     = "t2.micro" # Free Tier eligible
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  type        = string
}

variable "ec2_ssh_key_name" {
  description = "The SSH Key Name"
  type        = string
  default     = "free-tier-ec2-key"
}

variable "ec2_ssh_public_key_path" {
  description = "The local path to the SSH Public Key"
  type        = string
}
