# info
- these are my cross-platform & linux-platform only configs.

## cross-platform configs
- should work on windows & linux & EVEN mac aswell (didn't test mac tho)
- helix & nvim & ncspot & gitui & yazi

## linux configs
- added linux only config files aswell (that work cross-os on linux; but not on windows)
- you can view my system configuration aswell in a separate repo (nixos)
- only included the apps that i manually configured; the ones that i only copied i kept out to give credit 
- fish & ghostty & hypr (land + lock + paper) & waybar
- (maybe some of them would work on mac aswell)

## static configs
- since, i'm not using them, they practically won't change
- so just not symlinked
- zed & vscode

# ideas to include
- nushell, if i use it
- powershell
- godot (can't really config that)
- visual studio & jetbrains IDES (intellij)

# installation
basically: symlink every folder

## linux
```bash
ln -s GIT/* ~/.config
```
where GIT is the cloned git folder

## windows
```batch
mklink /D NEW OLD
```
where NEW is the end location, usually %appdata%;
and where OLD is a subfolder of the cloned git repo;
note: some apps might not like symlinks (these are soft symlinks) on windows;

### in case wildcard works:
untested
```batch
mklink /D %appdata% GIT/*
```
where GIT is the cloned git folder
