default['pam_d']['services'] = value_for_platform_family(
  'debian' => {
    'common-session' => {
      'main' => {
        'pam_permit' => {
          'interface' => 'session',
          'control_flag' => '[default=1]',
          'name' => 'pam_permit.so',
          'disabled' => false
        },
        'pam_deny' => {
          'interface' => 'session',
          'control_flag' => 'requisite',
          'name' => 'pam_deny.so',
          'disabled' => false
        },
        'pam_permit_2' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_permit.so',
          'disabled' => false
        },
        'pam_unix' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_unix.so',
          'disabled' => false
        },
        'pam_ldap' => {
          'interface' => 'session',
          'control_flag' => '[success=ok default=ignore]',
          'name' => 'pam_ldap.so',
          'args' => 'minimum_uid=1000',
          'disabled' => false
        },
        'pam_mkhomedir' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_mkhomedir.so',
          'args' => 'skel=/etc/skel umask=0022',
          'disabled' => false
        },
        'pam_limits' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_limits.so',
          'disabled' => false
        },
      },
      'includes' => %w()
    },
    'common-session-noninteractive' => {
      'main' => {
        'pam_permit' => {
          'interface' => 'session',
          'control_flag' => '[default=1]',
          'name' => 'pam_permit.so',
          'disabled' => false
        },
        'pam_deny' => {
          'interface' => 'session',
          'control_flag' => 'requisite',
          'name' => 'pam_deny.so',
          'disabled' => false
        },
        'pam_permit_2' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_permit.so',
          'disabled' => false
        },
        'pam_unix' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_unix.so',
          'disabled' => false
        },
        'pam_ldap' => {
          'interface' => 'session',
          'control_flag' => '[success=ok default=ignore]',
          'name' => 'pam_ldap.so',
          'args' => 'minimum_uid=1000',
          'disabled' => false
        },
        'pam_limits' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_limits.so',
          'disabled' => false
        },
      },
      'includes' => %w()
    }
  }
)
