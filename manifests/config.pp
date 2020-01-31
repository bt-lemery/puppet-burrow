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

  $config_file_dir = dirname($config_file)

  $_default_templates = [
    'default-email.tmpl',
    'default-http-delete.tmpl',
    'default-http-post.tmpl',
    'default-slack-delete.tmpl',
    'default-slack-post.tmpl',
  ]

  $_default_templates.each |$template| {
    file { "${config_file_dir}/${template}":
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => "puppet:///modules/burrow/${template}",
    }
  }

}
