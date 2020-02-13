# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include burrow::service
class burrow::service (
  $user,
  $group,
  $config_dir,
  $pidfile,
){

  systemd::unit_file { 'burrow.service':
    content => epp ('burrow/systemd.service.epp',
      {
        'user'       => $user,
        'group'      => $group,
        'config_dir' => $config_dir,
        'pidfile'    => $pidfile,
      }
    ),
    mode    => '0644',
    before  => Service[burrow],
    notify  => Service[burrow],
  }

  service { burrow:
    ensure  => 'running',
    enable  => true,
  }

}
