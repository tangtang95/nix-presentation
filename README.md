# Nix Presentation

This repository contains a simple dotnix folder that is used for the presentation of a nix introduction talk

## How to install on WSL

First install WSL Ubuntu (when prompted the username use 'tangtang' to simplify the following step):
```
wsl --install Ubuntu
```

---
Optionally, if you want you can remove windows path in PATH so that performance will not be impacted by windows tools.
Just add this two lines to /etc/wsl.conf in your ubuntu and then restart wsl ubuntu instance

```
[interop]
appendWindowsPath=false
```
You can verify it with `echo $PATH`.
---

Then install nix via the command provided in this website https://nixos.org/download/#nix-install-windows. 
Once installed, re-enter the wsl shell in order to have the `nix-shell` command available.

### Home manager test
In order to build and manage your user home installation we need to clone the repository and use home-manager to install home:

```sh
nix-shell -p git home-manager
```

This will install git and home-manager package and enter a temporary shell where the bin associated to those two packages are available.

```sh
git clone https://github.com/tangtang95/nix-presentation.git ~/dotnix
```

In case you didn't use the 'tangtang' username, change in `flake.nix` the username to the one you specified, otherwise it will create a new account

Finally build your home folder with home-manager:

```sh
home-manager --extra-experimental-features 'nix-command flakes' switch --flake ~/dotnix
```

After the build is done, the current user should already have everything. You can try it out (e.g. run `fish`).
Then in case you change anything, you need to rebuild and switch home manager profile, there is no more need for extra experimental features:

```sh
home-manager switch --flake ~/dotnix
```

P.S. should works also on Linux Ubuntu
