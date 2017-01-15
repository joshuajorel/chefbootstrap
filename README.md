# Chef Bootstrap Sample

This is a bootstrap guide to quickly use Chef. It's a simple web server that connects to a MySQL database in AWS. There will be 2 methods to deploy the application. The first is using a standard Chef or Hosted Chef server. The second is via Chef Solo or local mode.

# Prerequisites

In your local machine, install the Chef DK. <https://docs.chef.io/install_dk.html>

Sign-up for a Hosted Chef account and create your own organization. Download the knife.rb file and ssh key then place it in the .chef folder.

Provision 2 AWS EC2 RHEL instances.

Make sure that one instance will have port 80 open, while the other has port 3306 open.

# Deployment

## Chef Server

Open the terminal and change the directory to the project folder. Run the following commands.

1) Install cookbook dependencies.

```sh
$ berks install
$ berks upload
```

2) Upload roles and environment:

```sh
$ knife role from file roles/*.json
$ knife environment from file environments/demo.json
```

3) Upload data_bags

```sh
$ knife upload data_bags
```

4) Upload cookbooks:

```sh
$ knife cookbook upload sqlserver
$ knife cookbook upload demo-app
```

5) Bootstrap sql server and web app server

```sh
$ knife bootstrap SQL_IP --ssh-user ec2-user --sudo --identity-file IDENTITY_FILE --node-name sql-server-1 --run-list 'role[sqlserver]'
$ knife bootstrap APP_IP --ssh-user ec2-user --sudo --identity-file IDENTITY_FILE --node-name demo-app-1 --run-list 'role[demo-app]'
```

Where:
SQL_IP is the IP Address of the EC2 instance where port 3306 is open.
APP_IP is the IP Address of the EC2 instance where port 80 is open.
IDENTITY_FILE is a path to the EC2 .pem file.

## Chef Solo
1) Add the IP Addresses to the corresponding files in the nodes folder.

2) Run the following commands:

```sh
$ chef-solo -c solo.rb -j nodes/sql-server-1.json
$ chef-solo -c solo.rb -j nodes/demo-app-1.json
```

# Additional Work

Initialize an additional web app instance then connect the 2 web app instances to a Nginx load balancer.
