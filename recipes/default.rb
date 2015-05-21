#
# Cookbook Name:: serv
# Recipe:: default
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

#backports is required for ldap ssh keys, must be set true before apt is called
if platform?("debian") and node['serv']['ldap_ssh_keys']['install']
  Chef::Log.warn("including debian::backports to install ssh > ")
  node.override['debian']['backports'] = true
end

if platform_family?("debian")
	include_recipe "apt::default"
	include_recipe "debian::default"
elsif platform_family?("rhel")
	include_recipe "yum"
end

include_recipe "hostnames::default"
include_recipe "timezone-ii::default"
include_recipe 'serv::sudoers'

%w[
  ntp
  logging
  mail
  collectd
  ldap_auth
  ldap_ssh_keys
].each do |serv_module|
  #this_module_enabled = node['serv'][serv_module]['install']
  #if node['serv'][serv_module]['install']
  #  include_recipe "serv::#{serv_module}"
  #end
  include_recipe "serv::#{serv_module}" if node['serv'][serv_module]['install']
end

if node['ec2']
	include_recipe "serv::aws"
end