mkdir -p sftp-config/
ssh-keygen -t ed25519 -f sftp-config/ssh_host_ed25519_key < /dev/null
ssh-keygen -t rsa -b 4096 -f sftp-config/ssh_host_rsa_key < /dev/null
