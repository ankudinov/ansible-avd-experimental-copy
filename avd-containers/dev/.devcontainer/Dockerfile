ARG FROM_IMAGE
ARG FROM_VARIANT

FROM ${FROM_IMAGE}:${FROM_VARIANT}

ARG USERNAME

# switch user to vscode otherwise Ansible will be installed as root
USER ${USERNAME}
ENV PATH=$PATH:/home/${USERNAME}/.local/bin
