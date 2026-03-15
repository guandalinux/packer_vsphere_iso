# Copyright 2023-2024 Broadcom. All rights reserved.
# SPDX-License-Identifier: BSD-2

# Debian 12
# https://www.debian.org/releases/bookworm/amd64/

# Network
# d-i debian-installer/add-kernel-opts string net.ifnames=0
# d-i preseed/late_command string \
#     echo 'SUBSYSTEM=="net", ACTION=="add", DRIVERS=="vmxnet3", NAME="eth0"' > /target/etc/udev/rules.d/70-persistent-net.rules

# Locale and Keyboard
d-i debian-installer/locale string fr_FR
d-i keyboard-configuration/xkb-keymap select fr(latin9)

# Configure NTP
d-i clock-setup/ntp-server string ntp.intra

# Grub and Reboot Message
d-i finish-install/reboot_in_progress note
d-i grub-installer/only_debian boolean true

# Partitioning
${partition}

# Mirror settings
d-i mirror/country string manual
d-i mirror/http/hostname string deb.debian.org
d-i mirror/http/directory string /debian
d-i mirror/http/proxy string

# Bypass user default
d-i passwd/user-fullname string ${username}
d-i passwd/username string ${username}
d-i passwd/user-password password ${user_password}
d-i passwd/user-password-again password ${user_password}

# User Root Configuration
d-i passwd/root-login boolean false

# Package Configuration
d-i pkgsel/run_tasksel boolean false
d-i pkgsel/include string ${additional_packages}

d-i apt-setup/cdrom/set-first boolean false
d-i popularity-contest/participate boolean false