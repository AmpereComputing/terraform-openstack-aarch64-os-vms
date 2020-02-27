#cloud-config
ssh_authorized_keys:
- "${tf_ssh_pubkey}"
- github:ppouliot
write_files:
- encoding: ""
  content: |-
    #!/bin/bash
    echo "Downloading and Installing Docker"
    curl -sfL https://get.docker.com | sh -
  owner: root
  path: /tmp/01_install_docker.sh
  permissions: '0755'
