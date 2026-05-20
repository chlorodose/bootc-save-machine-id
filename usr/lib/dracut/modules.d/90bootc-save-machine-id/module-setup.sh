#!/bin/bash
check() {
    return 0
}

depends() {
    echo "base"
    echo "systemd"
    echo "bootc"
    return 0
}

install() {
    inst "/usr/libexec/initrd-prepare-machine-id-efi"
    inst_simple "$moddir/initrd-prepare-machine-id-efi.service" "${systemdsystemunitdir}/initrd-prepare-machine-id-efi.service"
    ln_r "../initrd-prepare-machine-id-efi.service" "${systemdsystemunitdir}/initrd-root-fs.target.wants/initrd-prepare-machine-id-efi.service"
}
