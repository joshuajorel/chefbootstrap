# Chef Bootstrap Sample

This is a bootstrap guide to quickly use Chef. It's a simple web server that connects to a MySQL database in AWS. There will be 2 methods to deploy the application. The first is using a standard Chef or Hosted Chef server. The second is via Chef Solo or local mode.

# Prerequisites

In your local machine, install the Chef DK. <https://docs.chef.io/install_dk.html>

Sign-up for a Hosted Chef account and create your own organization. Download the knife.rb file and ssh key then place it in the .chef folder.

Provision 2 AWS EC2 RHEL instances.

Make sure that one instance will have port 80 open, while the other has port 3306 open.

# Deployment

## Chef Server

1.) Initialize the MySQL server by uploading the mysql55 cookbook to the chef server and initializing the EC2 instance with port 3306 open. Run the following on your chef workstation:

```sh
$ knife cookbook upload mysql55
$ knife bootstrap SQL_INSTANCE_IP --ssh-user ec2-user --sudo --identity-file IDENTITY_FILE --node-name sql-node-1 --run-list 'recipe[mysql55]'
```

Replace the required values for the script.

2.)



# Additional Work

Initialize an additional web app instance then connect the 2 web app instances to a Nginx load balancer.


berks install
berks upload
upload data bags
