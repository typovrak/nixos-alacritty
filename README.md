# 💯 NixOS Alacritty

> Declarative NixOS module to install Alacritty terminal, deploy your per-user config with Catppuccin mocha green theme and ensure secure permissions.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/alacritty``` with ```700``` permissions and correct ownership.

- ⚙️ **Config deployment :** Installs your ```alacritty.toml``` into ```~/.config/alacritty/alacritty.toml``` with ```600``` permissions.

- 🎨 **Catppuccin mocha green theme :** Deploys ```catppuccin-mocha.toml``` alongside and imports it automatically.

- 🛠️ **PATH prepended :** Ensures ```coreutils``` are first in ```$PATH``` for reliable tooling.

- 📦 **Package installation :** Adds ```alacritty``` to ```environment.systemPackages```.

- 🔄 **Idempotent :** Safe to run on every rebuild, always enforces the same config state.

- 💾 **Backup guidance :** Docs include commands to back up any existing Alacritty config before changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/alacritty{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-alacritty = fetchGit {
    url = "https://github.com/typovrak/nixos-alacritty.git";
    ref = "main";
    rev = "79ee964748b62724b05e614c9bf379786d2392e7"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-alacritty}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Now, you can use ```alacritty``` as your default terminal !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
