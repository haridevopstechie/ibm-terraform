
data "ibm_resource_group" "group" {
  name = var.resource_group
}

data "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

data "ibm_is_subnet" "subnet" {
  count      = length(var.subnet_ids) //length(var.subnet_names)

  identifier = var.subnet_ids[count.index]//local.subnet_ids[count.index]
}

resource "ibm_container_vpc_cluster" "cluster" {
  
  name              = var.cluster_name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.group.id
  flavor            = var.machine_type
  worker_count      = var.workers_per_zone
  kube_version      = var.kube_version != "" ? var.kube_version : null
  tags              = var.tags
  wait_till         = "IngressReady" #var.wait_till

  dynamic zones {
    for_each = data.ibm_is_subnet.subnet
    content {
      subnet_id = zones.value.id
      name      = zones.value.zone
    }
  }

  disable_public_service_endpoint = var.disable_public_service_endpoint
}


resource "ibm_container_vpc_worker_pool" "pool" {

    vpc_id             = data.ibm_is_vpc.vpc.id
    resource_group_id  = data.ibm_resource_group.group.id
    cluster            = ibm_container_vpc_cluster.cluster.id
    worker_pool_name   = var.pool_name
    flavor             = var.machine_type
    worker_count       = var.workers_per_zone
    dynamic zones {
        for_each = data.ibm_is_subnet.subnet
        content {
            subnet_id = zones.value.id
            name      = zones.value.zone
        }
    }

}

resource "ibm_container_addons" "addons" {
  depends_on = [ ibm_container_vpc_cluster.cluster ]
  cluster = ibm_container_vpc_cluster.cluster.name
  addons {
    name    = "cluster-autoscaler"
    version = "1.0.1"
  }
}

resource "ibm_container_vpc_alb" "alb" {
  count  = var.enable_private_albs || var.enable_public_albs ? (2 * length(var.subnet_ids)) : 0
  alb_id = element(ibm_container_vpc_cluster.cluster.albs.*.id, count.index)
  enable = (
    (
      element(ibm_container_vpc_cluster.cluster.albs.*.alb_type, count.index) == "public"
      && var.enable_public_albs
      ) || (
      element(ibm_container_vpc_cluster.cluster.albs.*.alb_type, count.index) == "private"
      && var.enable_private_albs
    )
    ? true
    : false
  )
}