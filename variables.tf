variable "region" {
  type = list(string)
}

variable "LBname" {
  type = string
}

variable "PubIP"{

  type = list(string)  
}

variable "sg_ports" {

  type = list(number)
  default = [8200,8201,8300,9200,9500]
}