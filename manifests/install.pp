# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include burrow::install
class burrow::install (
  $version,
){

  package { 'burrow':
    ensure => $version,
  }

}
