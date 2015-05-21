#
# Cookbook Name:: serv
# Recipe:: duplicity
#
# Author:: Fahd Sultan (<fahdsultan@gmail.com>)
# Copyright (C) 2014 Fahd Sultan
#

=begin
#<
#>
=end

# The default destination is set as a cookbook attribute. You must override this!

# This is where you will store a copy of your key on the chef-client
secret = Chef::EncryptedDataBagItem.load_secret('/etc/chef/encrypted_data_bag_secret')

# This decrypts the data bag contents of "aws_iam->duplicity" and uses the key defined at variable "secret"
duplicity_key = Chef::EncryptedDataBagItem.load("iam_users", "duplicity", secret)
node.default['duplicity']['duplicity_environment']['AWS_ACCESS_KEY_ID'] = duplicity_key['aws_access_key_id']
node.default['duplicity']['duplicity_environment']['AWS_SECRET_ACCESS_KEY'] = duplicity_key['aws_secret_access_key']
node.default['duplicity']['backup_passphrase'] = duplicity_key['secret_passwd']

node.default['duplicity']['globbing_file_patterns']['/root'] = true
include_recipe "duplicity-backup::default"
