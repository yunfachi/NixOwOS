## nwixowos\.enable

Whether to enable the NwixOwOS module for NixOS\.



*Type:*
boolean



*Default:*
` false `



## nwixowos\.id



The machine-readable identifier used in place of “nixos”\.



*Type:*
string



*Default:*
` "nwixowos" `



## nwixowos\.name



The human-readable name used in place of “NixOS”\.



*Type:*
string



*Default:*
` "NwixOwOS" `



## nwixowos\.os-release\.enable



Whether to enable os-release configuration\.



*Type:*
boolean



*Default:*
` true `



## nwixowos\.os-release\.changeId



Whether to override the default distribution ID in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `



## nwixowos\.os-release\.changeName



Whether to override the default distribution name in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `



## nwixowos\.os-release\.setIdLike



Whether to set the ` ID_LIKE ` field in ` os-release ` file to “nixos”\.



*Type:*
boolean



*Default:*
` true `



## nwixowos\.overlays\.enable



Whether to enable all NwixOwOS overlays by default\.



*Type:*
boolean



*Default:*
` true `



## nwixowos\.overlays\.fastfetch



Whether to enable the fastfetch overlay\.



*Type:*
boolean



*Default:*
` config.nwixowos.overlays.enable `



## nwixowos\.overlays\.neofetch



Whether to enable the neofetch overlay\.



*Type:*
boolean



*Default:*
` config.nwixowos.overlays.enable `



## nwixowos\.overlays\.nitch



Whether to enable the nitch overlay\.



*Type:*
boolean



*Default:*
` config.nwixowos.overlays.enable `



## nwixowos\.overlays\.nixos-icons



Whether to enable the nixos-icons overlay\.



*Type:*
boolean



*Default:*
` config.nwixowos.overlays.enable `


