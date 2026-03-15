d-i partman-auto/disk string /dev/sda
d-i partman-auto/method string lvm
d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true
d-i partman-lvm/device_remove_lvm boolean true

# Force UEFI booting ('BIOS compatibility' will be lost). Default: false.
d-i partman-efi/non_efi_system boolean false

d-i partman/alignment select optimal

# Ensure the partition table is GPT - this is required for EFI
d-i partman-partitioning/choose_label select gpt
d-i partman-partitioning/default_label string gpt

d-i partman-auto-lvm/guided_size string max
d-i partman-auto/expert_recipe string                         \
      boot ::                                                 \
                1024 1024 1024 ext4                           \
                    mountpoint{ /boot }                       \
                    $primary{ }                               \
                    $bootable{ }                              \
                    method{ format }                          \
                    format{ }                                 \
                    use_filesystem{ }                         \
                    filesystem{ ext4 }                        \
                    label { BOOTFS }                          \
                .                                             \
      pv_vg ::                                                \
              1 1 1 ext4                                      \
                      $defaultignore{ } $primary{ }           \
                      method{ lvm }                           \
                      device{ /dev/sda2 }                     \
                      vg_name{ vg_system }                    \
              .                                               \
      vg_system ::                                            \
              1024 1024 1024 linux-swap                       \
                      $lvmok{ } lv_name{ lv_swap }            \
                      in_vg{ vg_system }                      \
                      method{ swap } format{ }                \
              .                                               \
              5120 5120 5120 ext4                             \
                      $lvmok{ } lv_name{ lv_root }            \
                      in_vg{ vg_system }                      \
                      mountpoint{ / }                         \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
              .                                               \
      vg_app ::                                               \
              1024 1024 1024 ext4                             \
                      $lvmok{ } lv_name{ lv_var_lib }         \
                      in_vg{ vg_system }                      \
                      mountpoint{ /var/lib }                  \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
              .                                               \
      vg_log ::                                               \
              1024 1024 1024  ext4                            \
                      $lvmok{ } lv_name{ lv_var_log }         \
                      in_vg{ vg_system }                      \
                      mountpoint{ /var/log }                  \
                      method{ format } format{ }              \
                      use_filesystem{ } filesystem{ ext4 }    \
              .                                               \

d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true