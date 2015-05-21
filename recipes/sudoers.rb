#
# Cookbook Name:: serv
# Recipe:: sudoers
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Basic sudoer recipe.  Should be included from other recipies instead of sudo

#>
=end

node.default['authorization']['sudo']['users'] = ["root"]
node.default['authorization']['sudo']['include_sudoers_d'] = true
node.default['authorization']['sudo']['groups'] = ["sudo", "wheel", "sysops"]
node.default['authorization']['sudo']['sudoers_defaults'] = [
  'env_reset',
  'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
]

include_recipe 'sudo'

