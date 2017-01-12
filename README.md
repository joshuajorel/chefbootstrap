# Overview

This is a bootstrap guide to quickly use Chef. It's a simple web server that connects to a MySQL database in AWS. There will be 2 methods to deploy the application. The first is using a standard Chef or Hosted Chef server. The second is via Chef Solo or local mode.

# Prerequisites

In your local machine, install the Chef DK. <https://docs.chef.io/install_dk.html>

Sign-up for a Hosted Chef account and create your own organization. Download the knife.rb file and ssh key then place it in the .chef folder.

Provision 2 AWS EC2 instances.

Make sure that one instance will have port 80 open, while the other has port 3306 open.


<https://docs.chef.io/knife.html>

# Additional Work

Initialize an additional 2 EC2 instances and
