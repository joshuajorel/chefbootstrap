name 'sqlserver'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures sqlserver'
long_description 'Installs/Configures sqlserver'
version '0.4.0'

depends 'selinux', '~>0.9.0'
depends 'yum-mysql-community', '~>2.0.3'
depends 'mysql', '~> 8.2'
depends 'mysql2_chef_gem', '~> 1.1'
depends 'database', '~> 6.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/sqlserver/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/sqlserver' if respond_to?(:source_url)
