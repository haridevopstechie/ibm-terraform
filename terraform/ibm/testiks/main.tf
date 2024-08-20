module "vpc_kubernetes_cluster" {
  source = "../modules/iks_module"

  resource_group                  = "test"
  vpc_name                        = "iks-vpc"
  vpc_id                          = "r006-6f1a4cc3-4d7d-4a6e-8dfc-fd8d3f1f5bab"
  subnet_ids                      = ["0717-07023fdd-631d-4e0d-ace0-43ac4271bb3b", "0727-bdd69137-3929-4586-b206-6020869c80ca"]
  cluster_name                    = "iks-cluster"
  machine_type                    = "bx2.4x16"
  workers_per_zone                = 3
  kube_version                    = "1.29.7"
  pool_name                       = "node-pool"
  tags                            = ["tag1", "tag2"]
  disable_public_service_endpoint = false
  autoscaling                     = true
}
