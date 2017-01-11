!#/bin/bash
knife bootstrap 52.14.17.231 --ssh-user USER --sudo --identity-file IDENTITY_FILE --node-name node1-centos --run-list 'recipe[learn_chef_httpd]'
