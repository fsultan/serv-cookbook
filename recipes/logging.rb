#
# Cookbook Name:: serv
# Recipe:: logging
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

#set loggly tags, ['loggly']['tags'] takes preceedece over ['tags']
default['loggly']['tags'] = node['serv']['logging']['loggly']['tags'] || node['serv']['logging']['tags']

include_recipe 'logrotate::default'

if node['serv']['logging']['loggly']['token']
  default['loggly']['token']['value'] = node['serv']['loggly']['token']
  include_recipe 'loggly-rsyslog::default'
end
