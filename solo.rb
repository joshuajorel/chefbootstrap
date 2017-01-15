current_dir = File.dirname(__FILE__)

cookbook_path       ["#{current_dir}/scookbooks"]
data_bag_path       '#{current_dir}/data_bags'
environment         'demo'
environment_path    '#{current_dir}/environments'
node_path           '#{cuurent_dir}/nodes'
rest_timeout        300
role_path           '#{current_dir}/roles'
solo                false
umask               0022
verbose_logging     nil
