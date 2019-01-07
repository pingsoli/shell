#!/bin/bash
# Showing ip address when starting ubuntu system, when you want to check ip
# address from inner virtual machine OS and login by remote login tools.

# Check execution permission
if [[ $EUID -ne 0 ]]; then
  echo "Requied root permissio"
  exit 1
fi

sh_file="/usr/local/bin/get-ip-address"

# Create a shell script invoked by following when starting ubuntu system.
# NOTE: `ifconfig` is deprecated in ubuntu 18.04, use `ip` command instead.
cat >$sh_file << 'EOF'
#!/bin/bash

# /sbin/ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{ print $2 }'
/sbin/ip a | grep "inet " | grep -v "127.0.0.1" | awk '{ print $2 }'
EOF

# Add executable permission to /usr/local/bin/get-ip-address
chmod 755 $sh_file

# Copying /etc/issue to /etc/issue-standard as a template file.
cp /etc/issue /etc/issue-standard

nc_run_sh="/etc/network/if-up.d/show-ip-address"
cat >$nc_run_sh << 'EOF'
#!/bin/bash
if [ "$METHOD" = loopback ]; then
  exit 0
fi

# Only run from ifup.
if [ "$MODE" != start ]; then
  exit 0
fi

cp /etc/issue-standard /etc/issue
/bin/bash /usr/local/bin/get-ip-address >> /etc/issue
echo "" >> /etc/issue
EOF

# Add executable permission to /etc/network/if-up.d/show-ip-address
chmod 755 $nc_run_sh
