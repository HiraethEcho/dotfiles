function IgnorePackagesAll() {
    mapfile -t ignore_foreign_packages < <(pacman -Qqm)
    mapfile -t ignore_packages < <(pacman -Qqn)
}
