

# Fri Jul 25 14:12:41 CST 2025 - New / changed files


CreateFile /etc/.pwd.lock 600 > /dev/null
CreateDir /etc/colord '' colord colord
CopyFile /etc/default/grub
CopyFile /etc/docker/daemon.json
CopyFile /etc/environment
CopyFile /etc/fstab
CopyFile /etc/iptables/ip6tables.rules
CopyFile /etc/iwd/main.conf
CopyFile /etc/libvirt/qemu/freebsd14.2.xml 600
CreateLink /etc/libvirt/qemu/networks/autostart/default.xml /etc/libvirt/qemu/networks/default.xml
CopyFile /etc/libvirt/qemu/networks/default.xml
CopyFile /etc/libvirt/qemu/win10iot.xml 600
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Asia/Shanghai
CopyFile /etc/makepkg.conf
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux-zen.preset
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/modprobe.d/nobeep.conf
CopyFile /etc/npmrc 666
CreateLink /etc/os-release ../usr/lib/os-release
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/pacman.d/mirrorlist.pacnew
CopyFile /etc/resolv.conf
CopyFile /etc/sddm.conf
CopyFile /etc/shells
CreateFile /etc/subgid- > /dev/null
CreateFile /etc/subuid- > /dev/null
CopyFile /etc/systemd/system.conf
CopyFile /etc/systemd/system/ali-tunnel.service
CopyFile /etc/systemd/system/archhome-tunnel-5G.service
CopyFile /etc/systemd/system/archhome-tunnel.service
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CopyFile /etc/systemd/system/cloudflared-update.service
CopyFile /etc/systemd/system/cloudflared-update.timer
CopyFile /etc/systemd/system/cloudflared.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/default.target.wants/ollama-webui.service /etc/systemd/system/ollama-webui.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/getty.target.wants/kmsconvt@tty2.service /usr/lib/systemd/system/kmsconvt@.service
CopyFile /etc/systemd/system/getty@tty1.service.d/skip-username.conf.bak
CopyFile /etc/systemd/system/grub-btrfsd.service.d/override.conf
CreateLink /etc/systemd/system/multi-user.target.wants/ali-tunnel.service /etc/systemd/system/ali-tunnel.service
CreateLink /etc/systemd/system/multi-user.target.wants/cloudflared.service /etc/systemd/system/cloudflared.service
CreateLink /etc/systemd/system/multi-user.target.wants/cups-browsed.service /usr/lib/systemd/system/cups-browsed.service
CreateLink /etc/systemd/system/multi-user.target.wants/cups.path /usr/lib/systemd/system/cups.path
CreateLink /etc/systemd/system/multi-user.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/multi-user.target.wants/ip6tables.service /usr/lib/systemd/system/ip6tables.service
CreateLink /etc/systemd/system/multi-user.target.wants/iptables.service /usr/lib/systemd/system/iptables.service
CreateLink /etc/systemd/system/multi-user.target.wants/iwd.service /usr/lib/systemd/system/iwd.service
CreateLink /etc/systemd/system/multi-user.target.wants/ollama-webui.service /etc/systemd/system/ollama-webui.service
CreateLink /etc/systemd/system/multi-user.target.wants/ollama.service /etc/systemd/system/ollama.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CopyFile /etc/systemd/system/olist.service
CopyFile /etc/systemd/system/ollama-webui.service
CopyFile /etc/systemd/system/ollama.service
CopyFile /etc/systemd/system/ollama.service.d/override_gfx_version.conf
CreateLink /etc/systemd/system/printer.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/sockets.target.wants/cups-lpd.socket /usr/lib/systemd/system/cups-lpd.socket
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/timers.target.wants/snapper-boot.timer /usr/lib/systemd/system/snapper-boot.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-cleanup.timer /usr/lib/systemd/system/snapper-cleanup.timer
CreateLink /etc/systemd/system/timers.target.wants/snapper-timeline.timer /usr/lib/systemd/system/snapper-timeline.timer
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket
CopyFile /etc/systemd/zram-generator.conf
CopyFile /etc/zsh/zprofile
CopyFile /etc/zsh/zshenv


# Fri Jul 25 14:12:41 CST 2025 - New file properties


SetFileProperty /etc/openlist group openlist
SetFileProperty /etc/openlist owner openlist


# Thu Jul 31 23:48:57 CST 2025 - Extra files


RemoveFile /etc/systemd/system/ollama.service
RemoveFile /etc/systemd/system/multi-user.target.wants/ollama.service
RemoveFile /etc/systemd/system/multi-user.target.wants/ollama-webui.service
RemoveFile /etc/systemd/system/multi-user.target.wants/cups-browsed.service
RemoveFile /etc/systemd/system/multi-user.target.wants/cloudflared.service
RemoveFile /etc/systemd/system/getty.target.wants/kmsconvt@tty2.service
RemoveFile /etc/systemd/system/default.target.wants/ollama-webui.service
RemoveFile /etc/systemd/system/default.target.wants


# Thu Jul 31 23:48:57 CST 2025 - New / changed files


CopyFile /efi/BOCOVERY.bin 755
CopyFile /efi/EFI/Arch/grubx64.efi 755
CopyFile /efi/EFI/Boot/bootx64.efi 755
CopyFile /efi/EFI/Microsoft/Boot/BCD 755
CopyFile /efi/EFI/Microsoft/Boot/BCD.LOG 755
CreateFile /efi/EFI/Microsoft/Boot/BCD.LOG1 755 > /dev/null
CreateFile /efi/EFI/Microsoft/Boot/BCD.LOG2 755 > /dev/null
CopyFile /efi/EFI/Microsoft/Boot/BOOTSTAT.DAT 755
CopyFile /efi/EFI/Microsoft/Boot/CIPolicies/Active/\{5DAC656C-21AD-4A02-AB49-649917162E70\}.cip 755
CopyFile /efi/EFI/Microsoft/Boot/CIPolicies/Active/\{82443e1e-8a39-4b4a-96a8-f40ddc00b9f3\}.cip 755
CopyFile /efi/EFI/Microsoft/Boot/CIPolicies/Active/\{CDD5CB55-DB68-4D71-AA38-3DF2B6473A52\}.cip 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/chs_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/cht_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/jpn_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/kor_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/malgun_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/malgunn_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/meiryo_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/meiryon_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/msjh_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/msjhn_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/msyh_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/msyhn_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/segmono_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/segoe_slboot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/segoen_slboot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Fonts/wgl4_boot.ttf 755
CopyFile /efi/EFI/Microsoft/Boot/Resources/bootres.dll 755
CopyFile /efi/EFI/Microsoft/Boot/Resources/en-US/bootres.dll.mui 755
CopyFile /efi/EFI/Microsoft/Boot/Resources/zh-CN/bootres.dll.mui 755
CopyFile /efi/EFI/Microsoft/Boot/SecureBootRecovery.efi 755
CopyFile /efi/EFI/Microsoft/Boot/bg-BG/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/bg-BG/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/boot.stl 755
CopyFile /efi/EFI/Microsoft/Boot/bootmgfw.efi 755
CopyFile /efi/EFI/Microsoft/Boot/bootmgr.efi 755
CopyFile /efi/EFI/Microsoft/Boot/cs-CZ/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/cs-CZ/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/cs-CZ/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/da-DK/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/da-DK/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/da-DK/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/de-DE/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/de-DE/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/de-DE/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/el-GR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/el-GR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/el-GR/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/en-GB/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/en-GB/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/en-US/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/en-US/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/en-US/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/es-ES/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/es-ES/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/es-ES/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/es-MX/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/es-MX/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/et-EE/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/et-EE/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fi-FI/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fi-FI/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fi-FI/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fr-CA/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fr-CA/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fr-FR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fr-FR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/fr-FR/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/hr-HR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/hr-HR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/hu-HU/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/hu-HU/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/hu-HU/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/it-IT/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/it-IT/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/it-IT/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ja-JP/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ja-JP/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ja-JP/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_10df.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_10ec.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_1137.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_14e4.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_15b3.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_1969.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_19a2.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_1af4.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_02_8086.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_07_1415.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kd_0C_8086.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kdnet_uart16550.dll 755
CopyFile /efi/EFI/Microsoft/Boot/kdstub.dll 755
CopyFile /efi/EFI/Microsoft/Boot/ko-KR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ko-KR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ko-KR/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/lt-LT/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/lt-LT/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/lv-LV/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/lv-LV/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/memtest.efi 755
CopyFile /efi/EFI/Microsoft/Boot/nb-NO/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/nb-NO/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/nb-NO/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/nl-NL/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/nl-NL/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/nl-NL/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pl-PL/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pl-PL/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pl-PL/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-BR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-BR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-BR/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-PT/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-PT/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/pt-PT/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/qps-ploc/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ro-RO/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ro-RO/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ru-RU/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ru-RU/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/ru-RU/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sk-SK/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sk-SK/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sl-SI/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sl-SI/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sr-Latn-RS/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sr-Latn-RS/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sv-SE/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sv-SE/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/sv-SE/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/tr-TR/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/tr-TR/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/tr-TR/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/uk-UA/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/uk-UA/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/winsipolicy.p7b 755
CopyFile /efi/EFI/Microsoft/Boot/zh-CN/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/zh-CN/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/zh-CN/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/zh-TW/bootmgfw.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/zh-TW/bootmgr.efi.mui 755
CopyFile /efi/EFI/Microsoft/Boot/zh-TW/memtest.efi.mui 755
CopyFile /efi/EFI/Microsoft/Recovery/BCD 755
CopyFile /efi/EFI/Microsoft/Recovery/BCD.LOG 755
CreateFile /efi/EFI/Microsoft/Recovery/BCD.LOG1 755 > /dev/null
CreateFile /efi/EFI/Microsoft/Recovery/BCD.LOG2 755 > /dev/null
CopyFile /efi/EFI/arch25/grubx64.efi 755
CopyFile /efi/EFI/refind/BOOT.CSV 755
CopyFile /efi/EFI/refind/drivers_x64/btrfs_x64.efi 755
CopyFile /efi/EFI/refind/icons-backup/arrow_left.png 755
CopyFile /efi/EFI/refind/icons-backup/arrow_right.png 755
CopyFile /efi/EFI/refind/icons-backup/boot_linux.png 755
CopyFile /efi/EFI/refind/icons-backup/boot_win.png 755
CopyFile /efi/EFI/refind/icons-backup/func_about.png 755
CopyFile /efi/EFI/refind/icons-backup/func_bootorder.png 755
CopyFile /efi/EFI/refind/icons-backup/func_csr_rotate.png 755
CopyFile /efi/EFI/refind/icons-backup/func_exit.png 755
CopyFile /efi/EFI/refind/icons-backup/func_firmware.png 755
CopyFile /efi/EFI/refind/icons-backup/func_hidden.png 755
CopyFile /efi/EFI/refind/icons-backup/func_install.png 755
CopyFile /efi/EFI/refind/icons-backup/func_reset.png 755
CopyFile /efi/EFI/refind/icons-backup/func_shutdown.png 755
CopyFile /efi/EFI/refind/icons-backup/mouse.png 755
CopyFile /efi/EFI/refind/icons-backup/os_arch.png 755
CopyFile /efi/EFI/refind/icons-backup/os_artful.png 755
CopyFile /efi/EFI/refind/icons-backup/os_bionic.png 755
CopyFile /efi/EFI/refind/icons-backup/os_centos.png 755
CopyFile /efi/EFI/refind/icons-backup/os_chakra.png 755
CopyFile /efi/EFI/refind/icons-backup/os_chrome.png 755
CopyFile /efi/EFI/refind/icons-backup/os_clover.png 755
CopyFile /efi/EFI/refind/icons-backup/os_crunchbang.png 755
CopyFile /efi/EFI/refind/icons-backup/os_debian.png 755
CopyFile /efi/EFI/refind/icons-backup/os_devuan.png 755
CopyFile /efi/EFI/refind/icons-backup/os_elementary.png 755
CopyFile /efi/EFI/refind/icons-backup/os_endeavouros.png 755
CopyFile /efi/EFI/refind/icons-backup/os_fedora.png 755
CopyFile /efi/EFI/refind/icons-backup/os_freebsd.png 755
CopyFile /efi/EFI/refind/icons-backup/os_frugalware.png 755
CopyFile /efi/EFI/refind/icons-backup/os_gentoo.png 755
CopyFile /efi/EFI/refind/icons-backup/os_gummiboot.png 755
CopyFile /efi/EFI/refind/icons-backup/os_haiku.png 755
CopyFile /efi/EFI/refind/icons-backup/os_hwtest.png 755
CopyFile /efi/EFI/refind/icons-backup/os_kubuntu.png 755
CopyFile /efi/EFI/refind/icons-backup/os_legacy.png 755
CopyFile /efi/EFI/refind/icons-backup/os_linux.png 755
CopyFile /efi/EFI/refind/icons-backup/os_linuxmint.png 755
CopyFile /efi/EFI/refind/icons-backup/os_lubuntu.png 755
CopyFile /efi/EFI/refind/icons-backup/os_mac.png 755
CopyFile /efi/EFI/refind/icons-backup/os_mageia.png 755
CopyFile /efi/EFI/refind/icons-backup/os_mandriva.png 755
CopyFile /efi/EFI/refind/icons-backup/os_manjaro.png 755
CopyFile /efi/EFI/refind/icons-backup/os_netbsd.png 755
CopyFile /efi/EFI/refind/icons-backup/os_network.png 755
CopyFile /efi/EFI/refind/icons-backup/os_opensuse.png 755
CopyFile /efi/EFI/refind/icons-backup/os_redhat.png 755
CopyFile /efi/EFI/refind/icons-backup/os_refind.png 755
CopyFile /efi/EFI/refind/icons-backup/os_refit.png 755
CopyFile /efi/EFI/refind/icons-backup/os_slackware.png 755
CopyFile /efi/EFI/refind/icons-backup/os_suse.png 755
CopyFile /efi/EFI/refind/icons-backup/os_systemd.png 755
CopyFile /efi/EFI/refind/icons-backup/os_trusty.png 755
CopyFile /efi/EFI/refind/icons-backup/os_ubuntu.png 755
CopyFile /efi/EFI/refind/icons-backup/os_uefi.png 755
CopyFile /efi/EFI/refind/icons-backup/os_unknown.png 755
CopyFile /efi/EFI/refind/icons-backup/os_void.png 755
CopyFile /efi/EFI/refind/icons-backup/os_win.png 755
CopyFile /efi/EFI/refind/icons-backup/os_win8.png 755
CopyFile /efi/EFI/refind/icons-backup/os_xenial.png 755
CopyFile /efi/EFI/refind/icons-backup/os_xubuntu.png 755
CopyFile /efi/EFI/refind/icons-backup/os_zesty.png 755
CopyFile /efi/EFI/refind/icons-backup/svg/boot_win.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/func_csr_rotate.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/mouse.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_clover.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_debian.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_devuan.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_elementary.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_gummiboot.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_haiku.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_legacy.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_mac.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_netbsd.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_redhat.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_refind.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_refit.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_win.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/os_xenial.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/tool_fwupdate.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/tool_memtest.svg 755
CopyFile /efi/EFI/refind/icons-backup/svg/tool_rescue.svg 755
CopyFile /efi/EFI/refind/icons-backup/tool_apple_rescue.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_fwupdate.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_memtest.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_mok_tool.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_netboot.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_part.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_rescue.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_shell.png 755
CopyFile /efi/EFI/refind/icons-backup/tool_windows_rescue.png 755
CopyFile /efi/EFI/refind/icons-backup/transparent.png 755
CopyFile /efi/EFI/refind/icons-backup/vol_efi.png 755
CopyFile /efi/EFI/refind/icons-backup/vol_external.png 755
CopyFile /efi/EFI/refind/icons-backup/vol_internal.png 755
CopyFile /efi/EFI/refind/icons-backup/vol_net.png 755
CopyFile /efi/EFI/refind/icons-backup/vol_optical.png 755
CopyFile /efi/EFI/refind/icons/arrow_left.png 755
CopyFile /efi/EFI/refind/icons/arrow_right.png 755
CopyFile /efi/EFI/refind/icons/boot_linux.png 755
CopyFile /efi/EFI/refind/icons/boot_win.png 755
CopyFile /efi/EFI/refind/icons/func_about.png 755
CopyFile /efi/EFI/refind/icons/func_bootorder.png 755
CopyFile /efi/EFI/refind/icons/func_csr_rotate.png 755
CopyFile /efi/EFI/refind/icons/func_exit.png 755
CopyFile /efi/EFI/refind/icons/func_firmware.png 755
CopyFile /efi/EFI/refind/icons/func_hidden.png 755
CopyFile /efi/EFI/refind/icons/func_install.png 755
CopyFile /efi/EFI/refind/icons/func_reset.png 755
CopyFile /efi/EFI/refind/icons/func_shutdown.png 755
CopyFile /efi/EFI/refind/icons/mouse.png 755
CopyFile /efi/EFI/refind/icons/os_arch.png 755
CopyFile /efi/EFI/refind/icons/os_artful.png 755
CopyFile /efi/EFI/refind/icons/os_bionic.png 755
CopyFile /efi/EFI/refind/icons/os_centos.png 755
CopyFile /efi/EFI/refind/icons/os_chakra.png 755
CopyFile /efi/EFI/refind/icons/os_chrome.png 755
CopyFile /efi/EFI/refind/icons/os_clover.png 755
CopyFile /efi/EFI/refind/icons/os_crunchbang.png 755
CopyFile /efi/EFI/refind/icons/os_debian.png 755
CopyFile /efi/EFI/refind/icons/os_devuan.png 755
CopyFile /efi/EFI/refind/icons/os_elementary.png 755
CopyFile /efi/EFI/refind/icons/os_endeavouros.png 755
CopyFile /efi/EFI/refind/icons/os_fedora.png 755
CopyFile /efi/EFI/refind/icons/os_freebsd.png 755
CopyFile /efi/EFI/refind/icons/os_frugalware.png 755
CopyFile /efi/EFI/refind/icons/os_gentoo.png 755
CopyFile /efi/EFI/refind/icons/os_gummiboot.png 755
CopyFile /efi/EFI/refind/icons/os_haiku.png 755
CopyFile /efi/EFI/refind/icons/os_hwtest.png 755
CopyFile /efi/EFI/refind/icons/os_kubuntu.png 755
CopyFile /efi/EFI/refind/icons/os_legacy.png 755
CopyFile /efi/EFI/refind/icons/os_linux.png 755
CopyFile /efi/EFI/refind/icons/os_linuxmint.png 755
CopyFile /efi/EFI/refind/icons/os_lubuntu.png 755
CopyFile /efi/EFI/refind/icons/os_mac.png 755
CopyFile /efi/EFI/refind/icons/os_mageia.png 755
CopyFile /efi/EFI/refind/icons/os_mandriva.png 755
CopyFile /efi/EFI/refind/icons/os_manjaro.png 755
CopyFile /efi/EFI/refind/icons/os_netbsd.png 755
CopyFile /efi/EFI/refind/icons/os_network.png 755
CopyFile /efi/EFI/refind/icons/os_opensuse.png 755
CopyFile /efi/EFI/refind/icons/os_redhat.png 755
CopyFile /efi/EFI/refind/icons/os_refind.png 755
CopyFile /efi/EFI/refind/icons/os_refit.png 755
CopyFile /efi/EFI/refind/icons/os_slackware.png 755
CopyFile /efi/EFI/refind/icons/os_suse.png 755
CopyFile /efi/EFI/refind/icons/os_systemd.png 755
CopyFile /efi/EFI/refind/icons/os_trusty.png 755
CopyFile /efi/EFI/refind/icons/os_ubuntu.png 755
CopyFile /efi/EFI/refind/icons/os_uefi.png 755
CopyFile /efi/EFI/refind/icons/os_unknown.png 755
CopyFile /efi/EFI/refind/icons/os_void.png 755
CopyFile /efi/EFI/refind/icons/os_win.png 755
CopyFile /efi/EFI/refind/icons/os_win8.png 755
CopyFile /efi/EFI/refind/icons/os_xenial.png 755
CopyFile /efi/EFI/refind/icons/os_xubuntu.png 755
CopyFile /efi/EFI/refind/icons/os_zesty.png 755
CopyFile /efi/EFI/refind/icons/svg/boot_win.svg 755
CopyFile /efi/EFI/refind/icons/svg/func_csr_rotate.svg 755
CopyFile /efi/EFI/refind/icons/svg/mouse.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_clover.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_debian.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_devuan.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_elementary.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_gummiboot.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_haiku.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_legacy.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_mac.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_netbsd.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_redhat.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_refind.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_refit.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_win.svg 755
CopyFile /efi/EFI/refind/icons/svg/os_xenial.svg 755
CopyFile /efi/EFI/refind/icons/svg/tool_fwupdate.svg 755
CopyFile /efi/EFI/refind/icons/svg/tool_memtest.svg 755
CopyFile /efi/EFI/refind/icons/svg/tool_rescue.svg 755
CopyFile /efi/EFI/refind/icons/tool_apple_rescue.png 755
CopyFile /efi/EFI/refind/icons/tool_fwupdate.png 755
CopyFile /efi/EFI/refind/icons/tool_memtest.png 755
CopyFile /efi/EFI/refind/icons/tool_mok_tool.png 755
CopyFile /efi/EFI/refind/icons/tool_netboot.png 755
CopyFile /efi/EFI/refind/icons/tool_part.png 755
CopyFile /efi/EFI/refind/icons/tool_rescue.png 755
CopyFile /efi/EFI/refind/icons/tool_shell.png 755
CopyFile /efi/EFI/refind/icons/tool_windows_rescue.png 755
CopyFile /efi/EFI/refind/icons/transparent.png 755
CopyFile /efi/EFI/refind/icons/vol_efi.png 755
CopyFile /efi/EFI/refind/icons/vol_external.png 755
CopyFile /efi/EFI/refind/icons/vol_internal.png 755
CopyFile /efi/EFI/refind/icons/vol_net.png 755
CopyFile /efi/EFI/refind/icons/vol_optical.png 755
CreateDir /efi/EFI/refind/keys
CopyFile /efi/EFI/refind/refind.conf 755
CopyFile /efi/EFI/refind/refind.conf-sample 755
CopyFile /efi/EFI/refind/refind_x64.efi 755
CopyFile /efi/EFI/refind/themes/nord/bg.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/arrow_left.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/arrow_right.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_about.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_csr_rotate.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_exit.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_firmware.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_hidden.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_reset.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/func_shutdown.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_altlinux.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_antergos.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_arch.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_cent.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_chakra.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_chrome.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_debian.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_deepin.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_elementary.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_fedora.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_freebsd.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_gentoo.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_ghostbsd.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_kali.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_kubuntu.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_legacy.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_linux.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_linuxmint.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_lubuntu.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_mac.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_mageia.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_mandriva.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_manjaro.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_mxlinux.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_openbsd.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_openmandriva.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_opensuse.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_pcbsd.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_puppy.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_redhat.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_refind.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_rosa.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_sabayon.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_slackware.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_solus.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_steam.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_suse.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_ubuntu.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_ubuntugnome.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_ubuntugnome_alt.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_ubuntumate.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_unknown.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_win.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_win8.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_xubuntu.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/os_zorin.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_apple_rescue.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_fwupdate.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_memtest.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_mok_tool.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_netboot.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_part.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_rescue.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_shell.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/tool_windows_rescue.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/vol_external.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/vol_internal.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/vol_net.png 755
CopyFile /efi/EFI/refind/themes/nord/icons/vol_optical.png 755
CopyFile /efi/EFI/refind/themes/nord/selection_big.png 755
CopyFile /efi/EFI/refind/themes/nord/selection_small.png 755
CopyFile /efi/EFI/refind/themes/nord/theme.conf 755
CopyFile /efi/EFI/refind/vars/PreviousBoot 755
CreateDir /efi/EFI/tools
CopyFile /efi/NvVars 755
CreateDir /efi/System\ Volume\ Information
CopyFile /etc/X11/xorg.conf.d/30-touchpad.conf
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer
CopyFile /etc/default/grub
CopyFile /etc/fstab
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/pacman.conf
CopyFile /etc/systemd/system/ollama.service.d/override_gfx_version.conf
