!#/bin/bash
knife bootstrap 52.14.70.219 --ssh-user ec2-user --sudo --identity-file ../joshua-chef-instance.pem --node-name webapp-1 --run-list 'recipe[demo-app]'
