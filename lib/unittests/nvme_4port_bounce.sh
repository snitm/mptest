#!/bin/bash

. ../backend_nvmefcloop

tail -f /var/log/messages &

echo "deleting remote ports..."

del_remote_ports

sleep 2

echo "adding remote ports..."

add_remote_ports

echo "immediately issuing IO to test...."

dd if=/dev/zero of=/dev/nvme1n1 bs=1024k count=4 count=10 oflag=direct

[ $? -eq 0 ] && echo "pass!" || echo "fail!?!"

# FIXME: need to be nicer about this and only kill the tail from above
killall -9 tail
