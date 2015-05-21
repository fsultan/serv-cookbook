#
# Cookbook Name:: serv
# Attributes:: duplicity
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

default['duplicity']['file_destination'] = "s3+http://backups/hosts/#{node['hostname']}"

default['duplicity']['full_if_older_than'] = '6D'
default['duplicity']['keep_n_full'] = 12
default['duplicity']['schedule']['hour'] = 3
default['duplicity']['schedule']['minute'] = 0
