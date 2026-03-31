## nixowos\.enable

Whether to enable the NixOwOS module\.



*Type:*
boolean



*Default:*

```nix
false
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default.nix)



## nixowos\.id



The machine-readable identifier used in place of “nixos”\.



*Type:*
string



*Default:*

```nix
"nixowos"
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default.nix)



## nixowos\.name



The human-readable name used in place of “NixOS”\.



*Type:*
string



*Default:*

```nix
"NixOwOS"
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default.nix)



## nixowos\.os-release\.enable



Whether to enable os-release configuration\.



*Type:*
boolean



*Default:*

```nix
true
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release.nix)



## nixowos\.os-release\.changeId



Whether to override the default distribution ID in the ` os-release ` file\.



*Type:*
boolean



*Default:*

```nix
true
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release.nix)



## nixowos\.os-release\.changeName



Whether to override the default distribution name in the ` os-release ` file\.



*Type:*
boolean



*Default:*

```nix
true
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release.nix)



## nixowos\.os-release\.setIdLike



Whether to set the ` ID_LIKE ` field in ` os-release ` file to “nixos”\.



*Type:*
boolean



*Default:*

```nix
true
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/os-release.nix)



## nixowos\.overlays\.enable



Whether to enable all NixOwOS overlays by default\.



*Type:*
boolean



*Default:*

```nix
true
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.overlays\.fastfetch



Whether to enable the fastfetch overlay\.



*Type:*
boolean



*Default:*

```nix
config.nixowos.overlays.enable
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.overlays\.hyfetch



Whether to enable the hyfetch overlay\.



*Type:*
boolean



*Default:*

```nix
config.nixowos.overlays.enable
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.overlays\.neofetch



Whether to enable the neofetch overlay\.



*Type:*
boolean



*Default:*

```nix
config.nixowos.overlays.enable
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.overlays\.nitch



Whether to enable the nitch overlay\.



*Type:*
boolean



*Default:*

```nix
config.nixowos.overlays.enable
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.overlays\.nixos-icons



Whether to enable the nixos-icons overlay\.



*Type:*
boolean



*Default:*

```nix
config.nixowos.overlays.enable
```

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/overlays.nix)



## nixowos\.useNixpkgsModule



Whether to set values for the ` nixpkgs ` module\. Needed to disable ` nixpkgs ` when using Home Manager as a module with ` config.home-manager.useGlobalPkgs ` set to ` true `\.



*Type:*
boolean



*Default:*
If ` specialArgs.osConfig.home-manager.useGlobalPkgs ` exists, then its negated value; otherwise, ` true `\.

*Declared by:*
 - [/nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default\.nix](file:///nix/store/rzpjrhsjd3jnida4ydz86dwraf1pmbjg-source/src/default.nix)


