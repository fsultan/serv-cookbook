#
# Cookbook Name:: serv
# Recipe:: ldap_auth
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Enable a server to authenticate against a LDAP Directory Server.

Recipe `openldap::auth` installs and configures libnss-ldapd, libpam-ldap, and ldap-utils.

openssh >= 6.2 is required for the AuthorizedKeysCommand feature which enables ssh public keys via ldap

The pam attribute file and recipe add pam_mkhomedir.so to common-session

ldap_keys.sh retrives ssh pub keys from ldap and is created via a template

#>
=end

node.default['openldap']['tls_enabled'] = node['serv']['ldap_auth']['tls_enabled']
node.default['openldap']['tls_checkpeer'] = node['serv']['ldap_auth']['tls_checkpeer']
#https://github.com/opscode-cookbooks/nscd/issues/6
node.default['nscd']['databases'] = %w{ passwd group hosts services }

include_recipe 'openldap::auth'
include_recipe 'pam'

#TODO replay with a notify
service "nscd" do
	action :restart
end
#TODO replay with a notify
service "nslcd" do
	action :restart
end
