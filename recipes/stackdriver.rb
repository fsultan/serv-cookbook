#
# Cookbook Name:: serv
# Recipe:: stackdriver
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

include_recipe 'stackdriver::default'
include_recipe 'stackdriver::plugins'

if node.has_recipe?('rabbitmq')
    case node[:platform]
        when "ubuntu", "debian", "amazon"
         if ( ( node[:platform].include?("ubuntu") && node[:platform_version].to_i >= 14.04 )  ||
           ( node[:platform].include?("debian") && node[:platform_version].to_i >= 7 ) )
            %w{libyajl2}.each do |pkg|
                package pkg do
                 action :install
                 end
            end
        else
            %w{libyajl1}.each do |pkg|
                package pkg do
                 action :install
                end
            end
         end

        when "centos", "redhat", "amazon"
            %w{yajl}.each do |pkg|
               package pkg do
                action :install
               end
            end
    end

    template "/opt/stackdriver/collectd/etc/collectd.d/rabbitmq.conf" do
      source "rabbitmq/rabbitmq.conf.erb"
      mode "0644"
      notifies :reload, "service[stackdriver-agent]", :delayed
    end
end
