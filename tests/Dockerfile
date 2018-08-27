ARG DOCKER_IMAGE_NAME
FROM $DOCKER_IMAGE_NAME
RUN echo "Using $DOCKER_IMAGE_NAME"

# Add local kitchen SSH public key to docker image's SSH authorized_keys
ARG SSH_KEY
RUN echo "$SSH_KEY" >> /home/kitchen/.ssh/authorized_keys
