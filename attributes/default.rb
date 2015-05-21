#
# Cookbook Name:: serv
# Attributes:: default
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

default['serv']['ntp']['install'] = true
default['serv']['mail']['install'] = true
default['serv']['ldap_auth']['install'] = false
default['serv']['ldap_ssh_keys']['install'] = false
default['serv']['logging']['install'] = false
default['serv']['collectd']['install'] = false

default['tz'] = "UTC"

default['set_fqdn'] = "*.local"
default['hostname_cookbook']['use_node_ip'] = false
#default['hostname_cookbook']['hostsfile_ip'] = '127.0.0.1'

default['apt']['compiletime'] = true
default['apt']['compile_time_update'] = true

default['debian']['backports'] = false

default['serv']['mail']['relayhosts'] = []

default['serv']['ldap_auth']['ldap_ssh_keys']['allowed_group'] = nil

default['serv']['ldap_auth']['tls_enabled'] = true
default['serv']['ldap_auth']['tls_checkpeer'] = false

default['serv']['logging']['loggly']['install'] = false
default['serv']['logging']['loggly']['token'] = nil

default['collectd']['version'] = '5.4.1'
default['collectd']['source_url_prefix'] = 'http://fossies.org/linux/privat'
default['collectd']['checksum'] = '853680936893df00bfc2be58f61ab9181fecb1cf45fc5cddcb7d25da98855f65'

default['collectd']['install_type'] = "package"
default['collectd']['graphite_prefix'] = "collectd."

#default['openssh'][''] = ''
default['openssh']['server']['use_dns'] = 'no'

include_attribute "serv::pam"
include_attribute "serv::duplicity"
