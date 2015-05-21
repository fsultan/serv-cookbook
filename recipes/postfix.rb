#
# Cookbook Name:: serv
# Recipe:: postfix
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Basic postfix client recipe.  Will not run if current host is the relay host.

#>
=end

relayhosts = node['serv']['mail']['relayhosts'].to_a

node.default['postfix']['main']['relayhost'] = relayhosts.shift
node.default['postfix']['main']['smtp_fallback_relay'] = relayhosts.shift

if node['postfix']['main']['relayhost'] != node['fqdn']
  include_recipe 'postfix::default'
end

