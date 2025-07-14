# 📎Windows Development Setup 2

- [📎Windows Development Setup 2](#windows-development-setup-2)
  - [🪟 Winget](#-winget)
    - [Minimal requirements for proceeding:](#minimal-requirements-for-proceeding)
    - [Browsers:](#browsers)
    - [Developer tools:](#developer-tools)
    - [Lenovo:](#lenovo)
    - [Others:](#others)
  - [🍨 Scoop](#-scoop)
  - [⚙️ Changing some Windows settings](#️-changing-some-windows-settings)
    - [📁 File Explorer](#-file-explorer)
    - [📋 Clipboard Manager](#-clipboard-manager)
    - [🫛 Virtualization](#-virtualization)
    - [🧩 Tiling window manager](#-tiling-window-manager)
      - [Disabling conflicting Windows \& PowerToys features](#disabling-conflicting-windows--powertoys-features)
    - [🎠 Disable virtual desktop animation](#-disable-virtual-desktop-animation)
  - [🐧 Windows Subsystem for Linux](#-windows-subsystem-for-linux)
  - [💫 Proto](#-proto)
  - [👓 Nerd Fonts](#-nerd-fonts)
  - [🚀 Starship](#-starship)
  - [🏁 Profiles \& Configurations](#-profiles--configurations)
  - [⬇️ Quake Terminal](#️-quake-terminal)


> *The [first one](https://gist.github.com/ugudango/4f8154847de32d3eac413c51caa281c6) was so good, I had to make a sequel.*

Wayland still doesn't work well with NVIDIA. I know you gasped in shock, but I had to tell you the truth.

Regardless, I can still pretend I'm on Linux if I install a tiling window manager and a Quake terminal.

Put on your Rust developer socks and let's go:

## 🪟 Winget

You can install packages via:

```ps
winget install
```

Example:

```ps
winget install Inkscape.Inkscape
```

### Minimal requirements for proceeding:

- 🌳 `Git.Git`

### Browsers:

- 🦊 `Mozilla.Firefox`

### Developer tools:

- 🏠 `Microsoft.DevHome`
- ⌨️ `Microsoft.WindowsTerminal`
- 🧑‍💻 `Microsoft.VisualStudioCode`
- 🪀 `Microsoft.PowerToys`
- 🐧 `Microsoft.WSL`
- 🪟 `LGUG2Z.komorebi` *
- 🐙 `GitHub.GitHubDesktop`
    - 🐙 `GitHub.cli`
- 🔨 `JetBrains.Toolbox`
- 📦 `RedHat.Podman`
    - 📦 `RedHat.Podman-Desktop`
- 🔐 `AgileBits.1Password` *
    - 🔒 `AgileBits.1Password.CLI` *

> [!NOTE]
> `Komorebi` requires a paid license for business use, but is free for personal use.
>
> [`FancyWM`](https://github.com/FancyWM/fancywm) is another very popular choice, and it's FOSS.

> [!NOTE]
> 1Password is a paid service. Apart from passwords, it can also do SSH keys, which is very useful for development.

### Lenovo:

- 🛠️ `BartoszCichecki.LenovoLegionToolkit`
- 🔃 `Lenovo.SystemUpdate`
- 🤓 `Lenovo.SUHelper` *

> [!CAUTION]
> `Lenovo.SUHelper` is Lenovo Vantage. LenovoLegionToolkit is a cleaner alternative with no telemetry.

### Others:

- ✒️ `Inkscape.Inkscape`
- 🐶 `GIMP.GIMP`
- 🎧 `Discord.Discord`
- 📝 `Notion.Notion`

## 🍨 Scoop

Scoop contains some packages that might not be on Winget yet.

Install it from [scoop.sh](https://scoop.sh/).

## ⚙️ Changing some Windows settings

### 📁 File Explorer

Search for `File Explorer Options` in your start menu.

Once there, access the `View` panel. In the `Advanced Settings` list, enable the following:

- ☑️ Show hidden files, folders and drives

And disable the following:

- ✖️ Hide extensions for known file types

These are the settings I always use. Explore the list further to configure things to your personal preferences.

### 📋 Clipboard Manager

Go to `System` > `Clipboard` > `Clipboard History` and turn it ☑️ **ON**.

### 🫛 Virtualization

Search for `Turn Windows features on or off` in your start menu.

Turn these options ☑️ **ON**:

- ☑️ Virtual Machine Platform
- ☑️ Windows Hypervisor Platform
- ☑️ Windows Subsystem for Linux

Reboot.

### 🧩 Tiling window manager

Komorebi is really good, but it's even better when you disable some Windows features.

#### Disabling conflicting Windows & PowerToys features

Since we're already tiling our windows with Komorebi, you can disable `FancyZones` from PowerToys.

From Windows Settings, turn `System` > `Multitasking` > `Snap Windows` ✖️ **OFF**.

### 🎠 Disable virtual desktop animation

> [!WARNING]
> In past versions of Windows you could disable animations using [ViVe Tools](https://github.com/thebookisclosed/ViVe/releases/).
> Every update seems to change feature IDs, so it's best not to go this route, at least for this guide.
> 
> If you still want to tinker with ViVe Tools, you could install `PeterStrick.ViVeTool-GUI` with `winget` to better inspect these IDs.

> [!NOTE]
> Alternatively, check out [this repo](https://github.com/FuPeiJiang/VD.ahk), apparently they can disable the animation by using AutoHotKey.

Windows animations tend to stutter, even on a high-end machine. Disabling them provides a snappier experience.

Set `Accessibility` > `Visual Effects` > `Animation Effects` to ✖️ **OFF**.

## 🐧 Windows Subsystem for Linux

In order to get the best experience, I recommend choosing Windows for everything that works as expected. Cross-platform tools, unless relying on some very specific functionality, should be used on Windows.

With this in mind, I understand that one might miss those POSIX syscalls.

Install Arch Linux using:

```ps
wsl --install archlinux
```

It should automatically open in the active PowerShell session. If not, just do:

```ps
wsl
```

A minimal, initial setup is necessary. A non-root user needs to be created, and some packages have to be installed. These actions are all performed in the WSL terminal.

```bash
# Update mirrors
pacman -Syu

# Install essentials
pacman -S base-devel git curl wget vim zsh sudo nano

# Add your user
useradd -m -G wheel -s /bin/zsh foobar

# Set your user's password
passwd foobar

# Update the sudoers file (please don't judge the nano usage)
EDITOR=nano visudo
```

Then do as suggested here:

```bash
## Uncomment to allow members of group wheel to execute any command
#  %wheel ALL=(ALL:ALL) ALL
```

By removing the hash:

```bash
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL:ALL) ALL
```

Then edit `wsl.conf` by doing:

```bash
nano /etc/wsl.conf
```

Set a default user, and make sure systemd is enabled:

```toml
[boot]
systemd=true

[user]
default=foobar
```

Now open a new window to access the Arch as a new non-root user.

> [!NOTE]
> If there is trouble with `systemd`, you can try installing `polkit`.

> [!WARNING]
> The default Arch Linux WSL image comes with a C locale, meaning that special characters will show up as `<ffffffff>` or `?`. To fix this, it's necessary to set up the locale, according to [this guide on Arch Wiki](https://wiki.archlinux.org/title/Locale).

There are other specific activities that might be useful for setting up a complete development environment, such as using the host windows certificates instead of using a completely separate SSH agent, but they are described in much better detail in the official [Arch Wiki article](https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL).

When using 1Password, however, it's sufficient to use [their guides](https://developer.1password.com/docs/ssh/integrations/wsl/) for these specific purposes only.

## 💫 Proto

> [!TIP]
> Install [`proto`](https://moonrepo.dev/proto) on both Windows and Linux.

Proto is, as the website suggests:

*A version manager for all your favorite languages and tools. A unified toolchain.*

This is what I use to install compilers & toolchains, such as `Rust`, `Python`, `Node`, `Deno`, `pnpm`, `dotnet`, `CMake` etc.

It doesn't support everything, but it supports a lot of popular things.

You can use it to configure global versions, but it works really well when you have multiple versions in place. [This section](https://moonrepo.dev/docs/proto/detection) describes this feature best.

## 👓 Nerd Fonts

Nerd fonts are recommended. Pick any from [this website](https://www.nerdfonts.com/).

## 🚀 Starship

> [!TIP]
> Install [`starship`](https://starship.rs) on both Windows and Linux.

Starship prompt is cross-platform. However, the preset doesn't tell you wether you're on Windows or on Linux. Some settings are contained in this repository as separate files. They are just aesthetic changes.

## 🏁 Profiles & Configurations

This repository contains some example profiles for both Windows and Linux. Windows profiles & configs are present at the root of the repository. WSL files are located under `/wsl`.

## ⬇️ Quake Terminal

Windows Terminal supports "Quake mode". You can read more about it [here](https://learn.microsoft.com/en-us/windows/terminal/tips-and-tricks#quake-mode).

To display tabs, `Ctrl + Shift + P` and do `Toggle focus mode`.

Alternatively, binding `globalSummon` creates the same behavior with a normal window, which will be centered (this can be configured) and will have multiple tabs. The only disadvantage

To achieve this, paste the following into the terminal JSON configuration:

> [!TIP]
> This is not a valid config format (specifying the `"keys"` in an action is not allowed). However, Windows Terminal parses and re-creates the config accordingly after the file is saved, moving the key bind in the right section.

```jsonc
// settings.json > actions[]
{
    "command":
    {
        "action": "globalSummon",
        "monitor": "any"
    },
    "keys": "win+sc(41)"
}
```