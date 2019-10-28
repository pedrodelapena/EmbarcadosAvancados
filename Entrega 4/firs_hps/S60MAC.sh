### Change mac
#!/bin/bash

case "$1" in
  start)
    ifconfig eth0 down
    ifconfig eth0 hw ether 42:00:61:66:7A:7D
    ifconfig eth0 up
    udchpc eth0
    ;;
  *)
    exit 1
    ;;