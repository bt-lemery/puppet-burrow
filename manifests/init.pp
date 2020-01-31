# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include burrow
#
# @version
#   Version of the burrow package to install.  Defaults to 1.3.2.
class burrow (
  $version,
){

  class{'burrow::install':
    version => $version,
  }

  class { 'burrow::config':
  }

  class { 'burrow::service':
  }

  Class['burrow::install']
  -> Class['burrow::config']
  ~> Class['burrow::service']

}
