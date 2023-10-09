#!/bin/bash

AVD_DEV_REQ_FILE="${HOME}/.ansible/collections/ansible_collections/arista/avd/requirements-dev.txt"

# install ansible if not yet installed and avd collection is locally mounted
ansible --version ||  if [ -f $AVD_DEV_REQ_FILE ]; then
  sudo chown -R ${USERNAME} ${HOME}/.ansible
  ANSIBLE_CORE_VERSION=$(cat ${AVD_DEV_REQ_FILE}| grep ansible-core)
  pip3 install "${ANSIBLE_CORE_VERSION}"
  ansible-galaxy collection install -r ${HOME}/.ansible/collections/ansible_collections/arista/avd/collections.yml
  pip3 install -r ${HOME}/.ansible/collections/ansible_collections/arista/avd/requirements.txt
fi

# execute command from docker cli if any
if [ ${@+True} ]; then
  exec "$@"
# otherwise just enter sh or zsh
else
  if [ -f "/bin/zsh" ]; then
    exec zsh
  else
    exec sh
  fi
fi