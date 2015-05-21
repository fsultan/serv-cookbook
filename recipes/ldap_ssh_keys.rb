#
# Cookbook Name:: serv
# Recipe:: ldap_ssh_keys
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
openssh >= 6.2 is required for the AuthorizedKeysCommand feature which enables ssh public keys via ldap

ldap_keys.sh retrives ssh pub keys from ldap and is created via a template

#>
=end

template "/usr/bin/ldap_keys.sh" do
  source "ldap_keys.sh.erb"
  mode "755"
end

%w[openssh-client openssh-server].each do |pkg|
  apt_preference pkg do
    pin "release o=Debian Backports"
    pin_priority "700"
  end
end

node.default['openssh']['server']['Authorized_Keys_Command'] = '/usr/bin/ldap_keys.sh'
node.default['openssh']['server']['Authorized_Keys_Command_User'] = 'nobody'

# install the package
package "openssh-server" do
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --force-yes'
  action :upgrade
end

include_recipe "openssh::default"

