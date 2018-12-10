# Prometheus testing
## Useful when debugging:

Setup GO build environmental variables. Useful on machines where a build failed:

    export GOROOT=/opt/prometheus/go/$(ls /opt/prometheus/go) ; export GOPATH="/opt/prometheus/tmp/$(ls /opt/prometheus/tmp)"; export PATH="$PATH:/opt/prometheus/go/$(ls /opt/prometheus/go)/bin"

Rerun INSPEC tests against a single docker container:

    inspec exec tests/inspec/default -t docker://DOCKER_ID

Test yaml syntax:

    yamllint --config-file=tests/yamllint.yml .

To test URLs:

    awesome_bot --skip-save-results --allow-dupe --white-list=localhost --files README.md,tests/README.md

Run Ansible lint:

    ansible-lint tasks/*

Verify that all software has an inspec test

    ./tests/all_software_inspec_tested

Run ADHOC commands inside a kitchen built docker image
1) Find the port mapped to SSH:

    docker ps

2) Change port 32835 in the example below:

    ANSIBLE_REMOTE_PORT=32835 ANSIBLE_HOST_KEY_CHECKING=False ansible -m setup -c ssh -u kitchen all -i localhost, --extra-vars="ansible_ssh_private_key_file=.kitchen/docker_id_rsa"


## Perform testing

Run standard tests for Archlinux:

    kitchen test archlinux

Run all tests for Archlinux, but force all software to build from source:

    KITCHEN_PLAYBOOK=build_all kitchen test archlinux

## Run tgroup tests

Test group definitions, client and server styles

    KITCHEN_PLAYBOOK=tgroups KITCHEN_INSPEC_SUITE=tgroups kitchen test archlinux --destroy=never

Test tgroups with purge enabled

    KITCHEN_IDEMPOTENY_TEST=false KITCHEN_PLAYBOOK=tgroups_purge KITCHEN_INSPEC_SUITE=tgroups kitchen test archlinux --destroy=never

Run Ansible manually against docker container, change port in example to what is seen in 'docker ps':

    ansible-playbook -i tests/inventory --ssh-extra-args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i $(pwd)/.kitchen/docker_id_rsa -p 32995" --extra-vars "pipelining=True" tests/playbooks/install_all.yml -u kitchen -l localhost
