#
# Cookbook Name:: mysql55
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
execute "yum update" do
  command "yum update -y"
end

yum_package "mysql55-server" do
  action :install
end

service "mysqld" do
  action [:enable, :start]
end

template "/tmp/user.sql" do
  source "user.sql.erb"
end

# TODO: parametrize user and encrypt password
execute "initialize web app user" do
  command "mysql -u root < /tmp/user.sql"
end

service "mysqld" do
  action :restart
end
