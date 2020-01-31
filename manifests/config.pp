# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include burrow::config
class burrow::config (
  $config_file,
){

  $_config = {

  }

  file { $config_file:
    owner => 'root',
    group => 'root',
    mode  => '0644',
    content => epp('burrow/config.pp', $_config),
  }

}
