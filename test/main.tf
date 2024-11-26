variable "x" {
  type    = string
  default = "Sagar"
}

output "out1" {
  value = var.x
}

output "out2" {
  value = "Hi there, I am pre-written word"
}

output "out3" {
  value = "Hi there, I am ${var.x}"
}

## Multiline Variable or Herecode string
variable "multiline" {
  type    = string
  default = <<EOT
    This is first line
    This is second line
    This is third line 
    This is fourth line
    EOT
}

output "out4" {
  value = var.multiline
}

## List Variable
variable "mylist" {
  type    = list(any)
  default = ["item1", "item2", "item3"]
}

output "out5" {
  value = var.mylist
}

output "out6" {
  value = var.mylist[2]
}

## Sensitive Variable
variable "sensitive" {
  type    = string
  default = "This data is sensitive"
}

output "out7" {
  sensitive = true
  value     = var.sensitive
}

## Map variable
variable "mymap" {
  type = map(any)
  default = {
    "name" = "Sagar Dahiya"
    "city" = "Sonipat"
    "team" = "Devops"
  }
}

output "out8" {
  value = var.mymap
}



