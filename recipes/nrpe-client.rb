#
# Cookbook Name:: serv
# Recipe:: nrpe-client
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#


=begin
#<

Setup nrpe client to work in conjunction with Shinken Server Setup

#>
=end

include_recipe 'nrpe::default'

# Use LWRP to define check_load
nrpe_check "check_load" do
  command "#{node['nrpe']['plugin_dir']}/check_load"
  warning_condition '25,20,15'
  critical_condition '50,45,40'
  action :add
end

# Use LWRP to define check_disk
nrpe_check "check_disk" do
  command "#{node['nrpe']['plugin_dir']}/check_disk"
  warning_condition '20%'
  critical_condition '10%'
  action :add
end

# Use LWRP to define check_swap
nrpe_check "check_swap" do
  command "#{node['nrpe']['plugin_dir']}/check_swap"
  warning_condition '30%'
  critical_condition '20%'
  action :add
end
