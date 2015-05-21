#
# Cookbook Name:: serv
# Recipe:: aws
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
Base recipe for AWS related settings

#>
=end

include_recipe "route53"

full_nodename = "#{node.name}.#{node[:route53][:fqdn]}"

route53_record "create a record" do
  name          full_nodename
  value         node[:ec2][:local_ipv4]
  type          "A"
  zone_id       node[:route53][:zone_id]
  ttl           node[:route53][:ttl]
  action :create
end
