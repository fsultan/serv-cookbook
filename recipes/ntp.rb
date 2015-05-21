#
# Cookbook Name:: serv
# Recipe:: ntp
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<

#>
=end

if node['ec2']
	node.default['ntp']['servers'] = [
	    '0.amazon.pool.ntp.org',
	    '1.amazon.pool.ntp.org',
	    '2.amazon.pool.ntp.org',
	    '3.amazon.pool.ntp.org'
	 ]
end

node.default['ntp']['sync_clock'] = true

include_recipe "ntp::default"

