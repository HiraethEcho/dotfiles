

# Sun Feb  8 12:12:10 PM CST 2026 - New / changed files


CreateFile /etc/.pwd.lock 600 > /dev/null
CopyFile /etc/X11/xorg.conf.d/30-touchpad.conf
CopyFile /etc/artalk/artalk.yml '' artalk artalk
CreateDir /etc/audisp
CreateDir /etc/audit/plugins.d 750
CreateDir /etc/audit/rules.d
CopyFile /etc/cloudflared/config.yml
CreateDir /etc/colord '' colord colord
CopyFile /etc/default/grub
CopyFile /etc/docker/daemon.json
CopyFile /etc/environment
CopyFile /etc/fstab
CopyFile /etc/iptables/ip6tables.rules
CopyFile /etc/iwd/main.conf
CopyFile /etc/keyd/default.conf
CopyFile /etc/libvirt/qemu/freebsd14.2.xml 600
CreateLink /etc/libvirt/qemu/networks/autostart/default.xml /etc/libvirt/qemu/networks/default.xml
CopyFile /etc/libvirt/qemu/win10iot.xml 600
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Asia/Shanghai
CopyFile /etc/ly/save.txt
CopyFile /etc/makepkg.conf
CopyFile /etc/makepkg.conf.d/fortran.conf
CopyFile /etc/makepkg.conf.d/fortran.conf.pacnew
CopyFile /etc/makepkg.conf.pacnew
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.conf.pacnew
CopyFile /etc/mkinitcpio.d/linux-zen.preset.pacsave
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/modprobe.d/nobeep.conf
CopyFile /etc/modules-load.d/iptables.conf
CopyFile /etc/npmrc 666
CreateDir /etc/opensnitchd/rules
CreateLink /etc/os-release ../usr/lib/os-release
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/pacman.d/mirrorlist.pacnew
CopyFile /etc/pki/ca-trust/source/anchors/fastgithub.crt
CopyFile /etc/resolv.conf
CopyFile /etc/sddm.conf
CopyFile /etc/shells
CreateFile /etc/subgid- > /dev/null
CreateFile /etc/subuid- > /dev/null
CopyFile /etc/systemd/coredump.conf.d/override.conf
CopyFile /etc/systemd/journald.conf.d/override.conf
CopyFile /etc/systemd/system.conf
CopyFile /etc/systemd/system.conf.pacnew
CopyFile /etc/systemd/system/archhome-tunnel-5G.service
CopyFile /etc/systemd/system/archhome-tunnel.service
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CopyFile /etc/systemd/system/cloudflared-update.service
CopyFile /etc/systemd/system/cloudflared-update.timer
CopyFile /etc/systemd/system/cloudflared.service
CopyFile /etc/systemd/system/copilot-api.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.Avahi.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/ly.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CopyFile /etc/systemd/system/getty@tty1.service.d/skip-username.conf
CopyFile /etc/systemd/system/glance-custom.service
CopyFile /etc/systemd/system/grub-btrfsd.service.d/override.conf
CreateLink /etc/systemd/system/multi-user.target.wants/ali-tunnel.service /etc/systemd/system/ali-tunnel.service
CreateLink /etc/systemd/system/multi-user.target.wants/avahi-daemon.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/cups.path /usr/lib/systemd/system/cups.path
CreateLink /etc/systemd/system/multi-user.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/multi-user.target.wants/ip6tables.service /usr/lib/systemd/system/ip6tables.service
CreateLink /etc/systemd/system/multi-user.target.wants/iptables.service /usr/lib/systemd/system/iptables.service
CreateLink /etc/systemd/system/multi-user.target.wants/iwd.service /usr/lib/systemd/system/iwd.service
CreateLink /etc/systemd/system/multi-user.target.wants/keyd.service /usr/lib/systemd/system/keyd.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CopyFile /etc/systemd/system/olist.service
CopyFile /etc/systemd/system/ollama-webui.service
CopyFile /etc/systemd/system/ollama.service.d/override_gfx_version.conf
CreateLink /etc/systemd/system/printer.target.wants/cups.service /usr/lib/systemd/system/cups.service
CopyFile /etc/systemd/system/radicale-hiraeth.service
CreateLink /etc/systemd/system/sockets.target.wants/avahi-daemon.socket /usr/lib/systemd/system/avahi-daemon.socket
CreateLink /etc/systemd/system/sockets.target.wants/cups-lpd.socket /usr/lib/systemd/system/cups-lpd.socket
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CopyFile /etc/systemd/system/star-tunnel.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-boot.timer /usr/lib/systemd/system/snapper-boot.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-cleanup.timer /usr/lib/systemd/system/snapper-cleanup.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-timeline.timer /usr/lib/systemd/system/snapper-timeline.timer
CreateLink /etc/systemd/user/graphical-session-pre.target.wants/xdg-user-dirs.service /usr/lib/systemd/user/xdg-user-dirs.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CopyFile /etc/systemd/zram-generator.conf
CopyFile /etc/udev/rules.d/99-uinput.rules
CreateDir /etc/userdb
CopyFile /etc/zsh/zprofile
CopyFile /etc/zsh/zshenv


# Sun Feb  8 12:12:11 PM CST 2026 - New file properties


SetFileProperty /etc/artalk group artalk
SetFileProperty /etc/artalk mode 750
SetFileProperty /etc/artalk owner artalk
