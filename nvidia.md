## NVIDIA Settings

The `nvidia-settings` tool lets you configure many options using either CLI or GUI.

You can run the GUI as a normal user and save the settings to `~/.nvidia-settings-rc`.

Then you can load the settings using
```
nvidia-settings --load-config-only
```
(for example in your `xinitrc`).

Alternatively, you can move the settings file to `/etc/X11/xorg.conf.d/20-nvidia.conf` where they will be loaded automatically.

## Minimal configuration
```conf
# /etc/X11/xorg.conf.d/20-nvidia.conf
# A basic configuration block in 20-nvidia.conf (or deprecated in xorg.conf):
Section "Device"
        Identifier "Nvidia Card"
        Driver "nvidia"
        VendorName "NVIDIA Corporation"
        Option "NoLogo" "true"
        #Option "UseEDID" "false"
        #Option "ConnectedMonitor" "DFP"
        # ...
EndSection
```
##Automatic configuration
The NVIDIA package includes an automatic configuration tool to create an Xorg server configuration file (xorg.conf) and can be run by:
```
# nvidia-xconfig
```
