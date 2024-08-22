##############################################################################
# Account variables
##############################################################################

variable resource_group {
    description = "Name for IBM Cloud Resource Group where resources will be deployed"
    type        = string
}


variable vpc_name {
    description = "Name of VPC where cluster is to be created"
    type        = string
}

variable vpc_id {
    description = "Id of VPC where cluster is to be created"
    type        = string
}

variable subnet_ids {
    description = "List of subnet ids. names will be added back in when the terraform provider can fetch all vpc subnets"
    type        = list
    default     = []
}


variable cluster_name {
    description = "Name of cluster to be provisioned"
    type        = string
    default     = "demo-cluster"
}

variable machine_type {
    description = "The flavor of VPC worker node to use for your cluster"
    type        = string
    default     = "cx2.4x8"
}

variable workers_per_zone {
    description = "Number of workers to provision in each subnet. Opnshift cluster "
    type        = number
    default     = 1
}

variable disable_public_service_endpoint {
    description = "Disable public service endpoint for cluster"
    type        = bool
    default     = false
}

variable kube_version {
    description = "Specify the Kubernetes version, including the major.minor version. To see available versions, run ibmcloud ks versions. To use the default, leave string empty"
    type        = string
    default     = ""
}

variable wait_till {
    description = "To avoid long wait times when you run your Terraform code, you can specify the stage when you want Terraform to mark the cluster resource creation as completed. Depending on what stage you choose, the cluster creation might not be fully completed and continues to run in the background. However, your Terraform code can continue to run without waiting for the cluster to be fully created. Supported args are `MasterNodeReady`, `OneWorkerNodeReady`, and `IngressReady`"
    type        = string
    default     = "IngressReady"
}

variable tags {
    description = "A list of tags to add to the cluster"
    type        = list
    default     = []
}

variable enable_public_albs {
    description = "Enable public albs"
    type        = bool
    default     = true
}


variable enable_private_albs {
    description = "Enable private albs"
    type        = bool
    default     = true
}


variable pool_name {
    description = "Name of the Worker Pool"
    type        = string
    default     = "default"
}

variable employee_id {
    description = "Name of the Worker Pool"
    type        = string
    default     = "default"
}

