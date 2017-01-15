#
# Cookbook Name:: demo-app
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# install epel repo
include_recipe "demo-app::install_deps"

sqlnode = search(:node, "name:sql-server-1").first
user = search(:sqlcreds,"username:#{sqlnode['sqlserver']['user']}").first

template '/opt/demo.py' do
  source 'demo.py.erb'
  mode '0755'
  variables(
    'host': "#{sqlnode["ipaddress"]}",
    'user': user['username'],
    'passwd': user['password'],
    'db': "#{sqlnode['sqlserver']['dbname']}")
  action :create
end

template '/etc/supervisord.conf' do
  source 'supervisord.conf.erb'
  action :create
end

service 'supervisord' do
  action [:enable, :start]
end
