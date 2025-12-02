## home-manager\.enableLegacyProfileManagement



Whether to enable legacy profile management during activation\. When
enabled, the Home Manager activation will produce a per-user
` home-manager ` Nix profile, just like in the standalone installation of
Home Manager\. Typically, this is not desired when Home Manager is
embedded in the system configuration\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.backupFileExtension

On activation move existing files by appending the given
file extension rather than exiting with an error\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "backup" `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.extraSpecialArgs



Extra ` specialArgs ` passed to Home Manager\. This
option can be used to pass additional arguments to all modules\.



*Type:*
attribute set



*Default:*
` { } `



*Example:*
` { inherit emacs-overlay; } `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.overwriteBackup



Whether to enable forced overwriting of existing backup files when using ` backupFileExtension `
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.sharedModules



Extra modules added to all users\.



*Type:*
list of raw value



*Default:*
` [ ] `



*Example:*
` [ { home.packages = [ nixpkgs-fmt ]; } ] `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.useGlobalPkgs



Whether to enable using the system configuration’s ` pkgs `
argument in Home Manager\. This disables the Home Manager
options ` nixpkgs.* `\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.useUserPackages



Whether to enable installation of user packages through the
` users.users.<name>.packages ` option\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.users



Per-user Home Manager configuration\.



*Type:*
attribute set of (Home Manager module)



*Default:*
` { } `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## home-manager\.verbose



Whether to enable verbose output on activation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [/nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common\.nix](file:///nix/store/c2gc2askw1770wf0q3y9i860fk6cj0b7-source/nixos/common.nix)



## nixowos\.enable



Whether to enable the NixOwOS module\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default.nix, via option denix.modules.nixowos.options)



## nixowos\.id



The machine-readable identifier used in place of “nixos”\.



*Type:*
string



*Default:*
` "nixowos" `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default.nix, via option denix.modules.nixowos.options)



## nixowos\.name



The human-readable name used in place of “NixOS”\.



*Type:*
string



*Default:*
` "NixOwOS" `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default.nix, via option denix.modules.nixowos.options)



## nixowos\.os-release\.enable



Whether to enable os-release configuration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release.nix, via option denix.modules.nixowos.options)



## nixowos\.os-release\.changeId



Whether to override the default distribution ID in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release.nix, via option denix.modules.nixowos.options)



## nixowos\.os-release\.changeName



Whether to override the default distribution name in the ` os-release ` file\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release.nix, via option denix.modules.nixowos.options)



## nixowos\.os-release\.setIdLike



Whether to set the ` ID_LIKE ` field in ` os-release ` file to “nixos”\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/os-release.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.enable



Whether to enable all NixOwOS overlays by default\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.fastfetch



Whether to enable the fastfetch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.hyfetch



Whether to enable the hyfetch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.neofetch



Whether to enable the neofetch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.nitch



Whether to enable the nitch overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.overlays\.nixos-icons



Whether to enable the nixos-icons overlay\.



*Type:*
boolean



*Default:*
` config.nixowos.overlays.enable `

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/overlays.nix, via option denix.modules.nixowos.options)



## nixowos\.useNixpkgsModule



Whether to set values for the ` nixpkgs ` module\. Needed to disable ` nixpkgs ` when using Home Manager as a module with ` config.home-manager.useGlobalPkgs ` set to ` true `\.



*Type:*
boolean



*Default:*
If ` specialArgs.osConfig.home-manager.useGlobalPkgs ` exists, then its negated value; otherwise, ` true `\.

*Declared by:*
 - [/nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default\.nix, via option denix\.modules\.nixowos\.options](file:///nix/store/svfppharscqh01bnkmyhyb75vlci16v4-source/src/default.nix, via option denix.modules.nixowos.options)


