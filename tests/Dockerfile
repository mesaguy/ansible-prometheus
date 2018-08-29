ARG DOCKER_IMAGE_NAME
FROM $DOCKER_IMAGE_NAME

# Add your specific Ansible SSH public key. This only works when run via
# kitchen, when run with the following options in your .kitchen.yml file:
#
#    driver_config:
#      build_options:
#        build-arg: SSH_KEY=<%= File.read('.kitchen/docker_id_rsa.pub') %>
#
ARG SSH_KEY
RUN echo "$SSH_KEY" >> /home/kitchen/.ssh/authorized_keys
