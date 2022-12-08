#!/usr/bin/env bash

setup_suite() {
    sudo ./image-builder install
    create_gentoo
}

create_gentoo() {
    image-builder create gentoo
}

test_disk_file_exists() {
    assert "stat iss-screen-device.img" "Disk file should exist"
}

test_disk_partition_count() {
    local n_expected_partitions
    n_expected_partitions=3
    n="$(fdisk -l iss-screen-device.img | grep \.img | grep -v Disk | wc -l)"
    assert_equals "$n_expected_partitions" "${n}" "Partition count should be 3"
}

test_disk_partition_mount_esp() {
    assert "image-builder mount 2" "ESP should be mountable"
    umount /mnt/tmp
}

test_disk_partition_mount_root() {
    assert "image-builder mount 3" "Root filesystem should be mountable"
    umount /mnt/tmp
}

teardown_suite() {
    printf "Running teardown\n"
}
