name             'serv'
maintainer       'Fahd Sultan'
maintainer_email 'fahdsultan@gmail.com'
license          'All rights reserved'
description      'Installs/Configures serv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ debian }.each do |os|
  supports os
end

depends 'apt'
depends 'debian'
depends 'hostnames'
depends 'logrotate', '~> 1.8.0'
depends 'ntp'
depends 'openldap'
depends 'openssh'
depends 'pam'
depends 'postfix'
depends 'sudo'
depends 'sysctl'
depends 'timezone-ii'
depends 'yum'

depends 'collectd'
depends 'nrpe'
depends 'loggly-rsyslog'
depends 'duplicity-backup'
