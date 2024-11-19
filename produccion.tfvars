tenant                 = "Tenant"
approfile              = "PRO-APP-01"
vrf                    = "Produccion"

bd = {
    "BD_WEB" = {
        name         = "BD_WEB",
        arp_flood    = "yes",
        ip_learn     = "yes",
        limit_learn  = "yes",
        u_route      = "no",
        unk_l2_ucast = "flood"
        alias        = "bd_web"
      },
    "BD_DB" = {
        name         = "BD_DB",
        arp_flood    = "yes",
        ip_learn     = "yes",
        limit_learn  = "yes",
        u_route      = "no",
        unk_l2_ucast = "flood"
        alias        = "bd_db"
    }
  }

subnet = {
    "BD_WEB" = {
        ip    = "192.168.200.1/24",
        bd    = "BD_WEB",
        scope = ["private", "shared"]
    },
    "BD_DB" = {
        ip    = "192.168.201.1/24",
        bd    = "BD_DB",
        scope = ["private", "shared"]
    }
  }

epg = {
    "EPG_WEB" = {
        name  = "EPG_WEB",
        bd    = "BD_WEB",
        desc  = "EPG Web PRO-APP-01",
        alias = "epg_web",
        ctx   = ""
    },
/*    "EPG_DB" = {
        name  = "EPG_DB",
        bd    = "BD_DB",
        desc  = "EPG Web PRO-APP-01",
        alias = "epg_db",
        ctx   = ""
    },
    "EPG_WEB01" = {
        name  = "EPG_WEB01",
        bd    = "BD_WEB",
        desc  = "EPG Web PRO-APP-01",
        alias = "epg_web",
        ctx   = ""
    },
*/    "EPG_DB01" = {
        name  = "EPG_DB01",
        bd    = "BD_DB",
        desc  = "EPG Web PRO-APP-01",
        alias = "epg_db",
        ctx   = ""
    }
  }