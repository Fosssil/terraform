module "mymod" {
  source = "./modules"
}

output "out_module" {
  value = module.mymod.o1
}
