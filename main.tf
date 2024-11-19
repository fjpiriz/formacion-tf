# Recuperación datos necesarios para la configuración
data "aci_tenant" "tenant" {
  name = var.tenant
}

data "aci_vrf" "vrf" {
  name      = var.vrf
  tenant_dn = data.aci_tenant.tenant.id
}

# Creación de application profile

resource "aci_application_profile" "ap" {
    tenant_dn = data.aci_tenant.tenant.id
    name      = var.approfile
}

# Creación de bridges domains

resource "aci_bridge_domain" "bd" {
    for_each                  = var.bd
    
    tenant_dn                 = data.aci_tenant.tenant.id
    relation_fv_rs_ctx        = data.aci_vrf.vrf.id
    name                      = each.value.name
    arp_flood                 = each.value.arp_flood
    ip_learning               = each.value.ip_learn
    limit_ip_learn_to_subnets = each.value.limit_learn
    unicast_route             = each.value.u_route
    unk_mac_ucast_act         = each.value.unk_l2_ucast
    name_alias                = each.value.alias
}

# Creación de subnets

resource "aci_subnet" "subnet" {
    for_each  = var.subnet

    parent_dn = aci_bridge_domain.bd[each.value.bd].id
    ip        = each.value.ip 
    scope     = each.value.scope
}

# Creación de EPGs

resource "aci_application_epg" "epg" {
    for_each               = var.epg

    name                   = each.value.name
    application_profile_dn = aci_application_profile.ap.id
    relation_fv_rs_bd      = aci_bridge_domain.bd[each.value.bd].id
    description            = each.value.desc
    name_alias             = each.value.alias
}