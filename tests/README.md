# Prometheus testing
## Useful when debugging:

Setup GO build environmental variables. Useful on machines where a build failed:

    export GOROOT=/opt/prometheus/go/$(ls /opt/prometheus/go) ; export GOPATH="/opt/prometheus/tmp/$(ls /opt/prometheus/tmp)"; export PATH="$PATH:/opt/prometheus/go/$(ls /opt/prometheus/go)/bin"

Rerun INSPEC tests against a single docker container:

    inspec exec tests/inspec/all -t docker://DOCKER_ID

Test yaml syntax:

    yamllint --config-file=tests/yamllint.yml .

To test URLs:

    awesome_bot --skip-save-results --allow-dupe --files README.md,tests/README.md

Run Ansible lint:

    ansible-lint tasks/*

Verify that all software has an inspec test

    ./tests/all_software_inspec_tested

Run ADHOC commands inside a kitchen built docker image
1) Find the port mapped to SSH:

    docker ps

2) Change port 32835 in the example below:

    ANSIBLE_REMOTE_PORT=32835 ANSIBLE_HOST_KEY_CHECKING=False ansible -m setup -c ssh -u kitchen all -i localhost, --extra-vars="ansible_ssh_private_key_file=.kitchen/docker_id_rsa"

## Run tgroup tests

Test group definitions, client and server styles

    KITCHEN_PLAYBOOK=tgroups KITCHEN_INSPEC_SUITE=tgroups kitchen test archlinux --destroy=never

Test tgroups with purge enabled

    KITCHEN_IDEMPOTENY_TEST=false KITCHEN_PLAYBOOK=tgroups_purge KITCHEN_INSPEC_SUITE=tgroups kitchen test archlinux --destroy=never
