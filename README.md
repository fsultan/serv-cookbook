# serv-cookbook

Provides a framework to set up a basic GNU/Linux server with standard tools and services.

### Supported Platforms

AWS

### Supported Operating Systems

Debian

## Attributes

Set these attribute for your infrastructure in environments or roles.
If you use organization wrapper cookbooks or environment cookbooks, set these attributes in recipes.  Setting them in upstream cookbook attributes does not guarantee precedence.

Serv uses many standard chef cookbooks. If you are using this framework in an existing chef deployment your environment or role settings can take precedence over 'serv' attributes.  In this case you may want to use higher precedence attribute types in your wrapper and environment cookbooks.

### Base attributes

`default['set_fqdn'] = '*.local'`

`default['tz'] = 'UTC'`

`default['serv']['mail']['relayhosts'] = ['relay-host.local','']`

### AWS attributes
`default['route53']['zone_id'] = ''`

`default['route53']['fqdn'] = ''`


### logging attributes
`default['serv']['logging']['tags'] = ['my.tag']`
`default['serv']['logging']['loggly']['token'] = 'hashvalue'`

### collectd attributes
`default['graphite']['server_address'] = ''`

`default['collectd']['graphite_prefix'] = 'collectd.'`

`default['collectd']['name']` is set in `serv::logging` recipe to `node['fqdn']`.  To supceed this in an upstream recipe you will have to use 'node.overide'.

## Usage

In a orginization wrapper cookbook select the extras to install

```
default['serv']['ntp']['install'] = true
default['serv']['postfix']['install'] = true
default['serv']['ldap_auth']['install'] = true
default['serv']['ldap_ssh_keys']['install'] = true
default['serv']['logging']['install'] = true
default['serv']['collectd']['install'] = true
```

### serv::default

Include `serv` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[serv::default]"
  ]
}
```

## License and Authors

Author:: Fahd Sultan (<fahdsultan@gmail.com>)
