#
# Cookbook Name:: sqlserver
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# hack: due to an issue with the mysql cookbook in rhel/centos, must perform this step first
template "/etc/sysconfig/selinux" do
  source "selinux.erb"
end

include_recipe 'selinux::permissive'

execute "yum local install mysql" do
  command "yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm -y"
end

# Configure the MySQL client.
mysql_client 'default' do
  action [:create]
end

root = search(:sqlcreds, "username:#{node['sqlserver']['root_username']}").first
user = search(:sqlcreds,"username:#{node['sqlserver']['user']}").first

# Configure the MySQL service.
mysql_service 'demo' do
  version '5.7'
  bind_address '0.0.0.0'
  initial_root_password root["password"]
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Create the database instance.
mysql_database node['sqlserver']['dbname'] do
  connection(
    :host => node['sqlserver']['host'],
    :username => node['sqlserver']['root_username'],
    :password => root["password"]
  )
  action :create
end

# Add a database user.
mysql_database_user node['sqlserver']['user'] do
  connection(
    :host => node['sqlserver']['host'],
    :username => node['sqlserver']['root_username'],
    :password => root["password"]
  )
  password user["password"]
  database_name node['sqlserver']['dbname']
  host '%'
  action [:create, :grant]
end

# initialize tables if it doesn't exist
template '/tmp/init.sql' do
  source 'init.sql.erb'
  action :create
end

execute 'execute init.sql script' do
  command "mysql -u #{node['sqlserver']['user']} -p#{user['password']} -S /var/run/mysql-demo/mysqld.sock < /tmp/init.sql"
end
