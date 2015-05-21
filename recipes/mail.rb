#
# Cookbook Name:: serv
# Recipe:: mail
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Basic mail client recipe.  Will not run if current host is the relay host.

#>
=end

include_recipe "serv::postfix"
