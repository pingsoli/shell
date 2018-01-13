#!/bin/bash
# Showing ip address when booting ubuntu system.
# NOTE: required root permission

# Required root permission.
if [[ $EUID -ne 0 ]]; then
  echo "Requied root permissio" 
  exit 1
fi

sh_file="/usr/local/bin/get-ip-address"

# Creating a shell script to show ip address(except localhost)
cat >$sh_file << 'EOF'
/sbin/ifconfig | grep "inet addr" | grep -v "127.0.0.1" | awk '{ print $2 }' | awk -F: '{ print $2 }'
EOF

# Add exec permission to /usr/local/bin/get-ip-address
chmod 755 $sh_file

# Copying /etc/issue to /etc/issue-standard as a template file.
cp /etc/issue /etc/issue-standard

nc_run_sh="/etc/network/if-up.d/show-ip-address"
cat >$nc_run_sh << 'EOF'
#!/bin/sh
if [ "$METHOD" = loopback ]; then
  exit 0
fi

# Only run from ifup.
if [ "$MODE" != start ]; then
  exit 0
fi

cp /etc/issue-standard /etc/issue
/usr/local/bin/get-ip-address >> /etc/issue
echo "" >> /etc/issue
EOF

# Add executable permission to /etc/network/if-up.d/show-ip-address
chmod 755 $nc_run_sh
