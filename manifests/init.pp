# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include burrow
#
# @version
#   Version of the burrow package to install.  Defaults to 1.3.2.
#
# @config_file
#   Path and name for burrow config file.  Defaults to '/etc/burrow/config'.
#
class burrow (
  String $version,
  String $config_file,
){

  class{'burrow::install':
    version => $version,
  }

  class { 'burrow::config':
    config_file => $config_file,
  }

  class { 'burrow::service':
  }

  Class['burrow::install']
  -> Class['burrow::config']
  ~> Class['burrow::service']

}
