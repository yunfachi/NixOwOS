## nixowos\.enable

Whether to enable the NixOwOS module for NixOS\.



*Type:*
boolean



*Default:*
` false `



## nixowos\.id



The machine-readable identifier used in place of “nixos”\.



*Type:*
string



*Default:*
` "nixowos" `



## nixowos\.name



The human-readable name used in place of “NixOS”\.



*Type:*
string



*Default:*
` "NixOwOS" `



## nixowos\.os-release\.enable



Whether to enable os-release configuration\.



*Type:*
boolean



*Default:*
` true `



## nixowos\.os-release\.changeId



Whether to override the default distribution ID in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `



## nixowos\.os-release\.changeName



Whether to override the default distribution name in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `



## nixowos\.os-release\.setIdLike



Whether to set the ` ID_LIKE ` field in ` os-release ` file to “nixos”\.



*Type:*
boolean



*Default:*
` true `



## nixowos\.overlays\.enable



Whether to enable all NixOwOS overlays by default\.



*Type:*
boolean



*Default:*
` true `



## nixowos\.overlays\.fastfetch



Whether to enable the fastfetch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `



## nixowos\.overlays\.neofetch



Whether to enable the neofetch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `



## nixowos\.overlays\.nitch



Whether to enable the nitch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `



## nixowos\.overlays\.nixos-icons



Whether to enable the nixos-icons overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `


