variable "aci_user" {
    type        = string 
    description = "Usuario de ACI"
    sensitive   = true
}

variable "aci_password" {
    type        = string 
    description = "Contraseña del usuario de ACI"
    sensitive   = true
}

variable "aci_url" {
    type        = string 
    description = "URL del APIC"
    default = "https://127.0.0.1/"
}

variable "tenant" {
    type        = string
    description = "Nombre del tenant"
}

variable "approfile" {
    type        = string
    description = "Nombre del application profile"
}

variable "vrf" {
    type        = string
    description = "Nombre de la VRF"
}

variable "bd" {
    type = map(object({
        name         = string
        arp_flood    = string
        ip_learn     = string
        limit_learn  = string
        u_route      = string
        unk_l2_ucast = string
        alias        = string
    }))
}

variable "subnet" {
    type = map(object({
        ip    = string
        bd    = string
        scope = list(string)
    }))
}

variable "epg" {
    type = map(object({
        name  = string
        bd    = string
        desc  = string
        alias = string
        ctx   = string
    }))
}