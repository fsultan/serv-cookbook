#
# Cookbook Name:: serv
# Recipe:: collectd
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Enable a server to send system stats via collecd to graphite.

Requires attributes:

	'graphite' => {
    	  'server_address' => ''
  	},
  	'collectd' => {
    	  'graphite_prefix' => 'servers.ENV.'
  	}

    Defaults:

	node["graphite"]["server_address"] = '127.0.0.1'
	node['collectd']['graphite_prefix'] = "collectd."
#>
=end

#node.default["graphite"]["server_address"] = "perfmon01.np.sm2.tv"

node.default['collectd']['name'] = node['fqdn']

include_recipe "collectd::client_graphite"

collectd_plugin "syslog" do
	options :LogLevel=>"info"
end

collectd_plugin 'syslog' do
  options :log_level => 'info',
    :notify_level => 'warning'
end

%w(cpu disk entropy memory swap interface load ).each do |plug|
  collectd_plugin plug
end

