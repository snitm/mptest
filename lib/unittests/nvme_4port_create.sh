#!/bin/bash

export NVME_FCLOOP_DEVICE="/dev/pmem0"

. ../backend_nvmefcloop

backend_create_device

echo

lsblk | grep nvme
