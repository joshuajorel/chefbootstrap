remote_file '/tmp/epel-release-latest-7.noarch.rpm' do
  source 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
  action :create
end

rpm_package "epel-release-latest-7.noarch.rpm" do
  source "/tmp/epel-release-latest-7.noarch.rpm"
  action :install
end

execute "update yum" do
  command "yum update -y"
end

["python-devel", "python-pip", "MySQL-python"].each do |p|
  yum_package p do
    action :install
  end
end

execute "upgrade pip" do
  command "pip install --upgrade pip"
end

["Flask", "gunicorn"].each do |p|
  execute "pip install " + p do
    command "pip install " + p
  end
end
