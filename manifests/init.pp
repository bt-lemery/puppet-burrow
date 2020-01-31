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
# @pidfile
#   The path and filename to store the PID of the running process in. Defaults to '/var/run/burrow.pid'.
#
# @stdout_logfile
#   If specified, it is the path and filename to redirect stdout and stderr into. If not specified, stdout/stderr are not redirected.  Defaults to ''.
#
# @access_control_allow_origin
#   The value to put in the Access-Control-Allow-Origin header in responses from the HTTP server in Burrow. Defaults to ''.
#
# @logging_file
#   The path and filename to write logs to. If not specified, logs are written to stdout. Defaults to ''.
#
# @logging_level
#   	The minimum log level to output. Must be one of "debug", "info", "warn", "error", "panic", "fatal".  Defaults to 'info'.
#
# @logging_maxsize
#   The maximum size for a log file, in MB. Defaults to 100.
#
# @logging_maxbackups
#   The maximum number of log files to maintain. Defaults to 10.
#
# @logging_maxage
#   The maximum number of days to keep log files for. Defaults to 30.
#
# @logging_use_localtime
#   If true, write log entries using the system's local time. Otherwise, use UTC.  Defaults to false.
#
# @logging_use_compression
#   If true, compress rotated log files. Defaults to false.
#
# @zookeeper_servers
#   An array of strings in the form "hostname:port" that point to the servers in the Zookeeper ensemble. At least one is required.
#
# @zookeeper_timeout
#   The expiration timeout for Zookeeper sessions, in seconds. Defaults to 6.
#
# @zookeeper_root_path
#   A full path to the znode that Burrow is allow to write under. The path will be created if it does not already exist.  Defaults to '/burrow/notifier'.
#
# @manage_client_profile
#   Whether to use this module to manage a client profile.  Defaults to false.
#
# @client_subheading
#   Unique subheading name for client profile.  Defaults to 'myclient'.
#
# @client_kafka_version
#   The client version of Kafka to support.
#   Valid versions are: 0.8, 0.8.0, 0.8.1, 0.8.2, 0.9, 0.9.0, 0.9.0.0, 0.9.0.1, 0.10, 0.10.0, 0.10.0.0, 0.10.0.1, 0.10.1, 0.10.1.0, 0.10.2, 0.10.2.0, 0.11.0,
#   0.11.0.1, 0.11.0.2, 1.0.0, 1.0.1, 1.0.2, 1.1.0, 1.1.1.  Defaults to 0.8.
#
# @client_id
#   A string to be passed to Kafka as the client ID.  Defaults to 'burrow-lagchecker'.
#
# @client_tls
#   If specified, it is the name of a TLS profile to use in this client configuration.  Defaults to ''.
#
# @client_sasl
#   If specified, it is the name of a SASL profile to use in this client configuration.  Defaults to ''.
#
# @manage_tls_profile
#   Whether to use this module to manage a TLS profile.  Defaults to false.
#
# @tls_subheading
#   Unique subheading name for TLS profile.  Defaults to 'mytlsprofile'.
#
# @tls_certfile
#   The path to the certificate file to be used (either a client certificate for client connections, or a server certificate for the HTTP server).
#   Required if using this module to manage a TLS profile.
#
# @tls_keyfile
#   The path to the key file that matches the certfile.  Defaults to ''.  Required if using this module to manage a TLS profile.
#
# @tls_cafile
#   If specified, it is the path to a bundle of certificates that provide the trusted root certificates for the connection.  Defaults to ''.
#
# @tls_no_verify
#   	If true, do not validate the trust of the certificate sent by the other side of this connection.  Defaults to false.
# @manage_sasl_profile
#   Whether to use this module to manage a TLS profile.  Defaults to false.
#
# @sasl_subheading
#   Unique subheading name for TLS profile.  Defaults to 'mysaslprofile'.
#
# @sasl_username
#   The username to use for authentication. Required if using this module to manage a SASL profile.
#
# @sasl_password
#   The password to use for authentication. Required if using this module to manage a SASL profile.
#
# @sasl_handshake_first
#   If false, do not send SASL handshake first (only used for Sarama connections to Kafka when using a non-Kafka proxy).  Defaults to true.
#
# @manage_httpserver_profile
#   Whether to use this module to configure the HTTP server in Burrow.  Defaults to false.
#
# @httpserver_subheading
#   Unique subheading name for HTTP server.  Defaults to 'mylistener'.
#
# @httpserver_address
#   This is a string of the form ip:port that specifies what the server should listen on. If the ip part is left blank, the listener attaches to
#   all IPs on the host. If the port part is left blank, a random port is chosen.  Required if using this module to manage the HTTP server in Burrow.
#
# @httpserver_timeout
#   The timeout and keepalive setting for connections, in seconds.  Defaults to 300.
#
# @httpserver_tls
#   If specified, it must be the name of a configured TLS profile and the listener is started with this configuration. Defaults to ''.
#
# @manage_storage_profile
#   Whether to use this module to manage a storage profile.  Defaults to false.
#
# @storage_subheading
#   Unique subheading name for storage profile.  Defaults to 'mystorage'.
#
# @storage_class_name
#   This is the name of the module type. The only permitted value is "inmemory".
#
# @storage_intervals
#   The number of offsets to store for each partition.  Defaults to 10.
#
# @storage_expire_group
#   The number of seconds after which a group will be purged if it has not committed offsets.  Defaults to 604800.
#
# @storage_workers
#   The number of worker goroutines to start up. This number can be increased to provide more parallelism in the storage module.  Defaults to 20.
#
# @storage_min_distance
#   Coalesce offset commits that are more frequent than this number of seconds. Used with the intervals configuration, this can be used to set a minimum
#   time for the offset window (10 offsets x 15s = 150s minimum window).  Defaults to 0.
#
# @storage_group_whitelist
#   If specified, ignore data for groups that do not match the regular expression.  Defaults to ''.
#
# @manage_evaluator_profile
#   Whether to use this module to configure the evaluator subsystem.  Defaults to false.
#
# @evaluator_subheading
#   Unique subheading name for evaluator subsystem.  Defaults to 'myeval'.
#
# @evaluator_class_name
#   This is the name of the module type. The only permitted value is "caching".
#
# @evaluator_expire_cache
#   The number of seconds to cache evaluation results for.  Defaults to 604800.
#
# @evaluator_minimum_complete
#   A minimum threshold for completeness for evaluating partitions: any partition which has a completeness below this value will be marked as OK without evaluating it.
#   Defaults to '0.0'
#
# @manage_cluster_profile
#   It is not required to specify a cluster profile, but if you don't you won't have Burrow doing any work.  Defaults to true.
#
# @cluster_subheading
#   Unique subheading name for cluster profile.  Defaults to 'mycluster'.
#
# @cluster_class_name
#   Name of cluster module. The only permitted value is 'kafka'.
#
# @cluster_servers
#   An array of strings in the form "hostname:port" that point to the servers in the Kafka cluster. At least one is required.
#
# @cluster_client_profile
#   The name of a configured client-profile section. If no profile is specified, a default configuration for the client will be used. Defaults to ''.
#
# @cluster_topic_refresh
#   How often to refresh the list of all topics in the cluster, in seconds. Defaults to 60.
#
# @cluster_offset_refresh
#   How often to refresh the broker offset for each partition, in seconds. Defaults to 10.
#
# @manage_consumers
#   It is not required to specify this section, but if you don't you won't have Burrow doing much work. Defaults to true.
#
# @consumers
#   An array of consumers.
#
# @manage_notifiers
#   Defaults to false.
#
# @notifiers
#   An array of notifiers.
#
class burrow (
  String $version,
  String $config_file,
  Array[String] $consumer_class_name,
  Array[String] $notifiers_class_name,
  Data $pidfile,
  Data $stdout_logfile,
  String $access_control_allow_origin,

  Data $logging_filename,
  Enum['debug', 'info', 'warn', 'error', 'panic', 'fatal'] $logging_level,
  Integer $logging_maxsize,
  Integer $logging_maxbackups,
  Integer $logging_maxage,
  Boolean $logging_use_localtime,
  Boolean $logging_use_compression,

  Array[String] $zookeeper_servers,
  Integer $zookeeper_timeout,
  Data $zookeeper_root_path,

  Boolean $manage_client_profile,
  Data $client_subheading,
  Data $client_kafka_version,
  String $client_id,
  String $client_tls,
  String $client_sasl,

  Boolean $manage_tls_profile,
  Data $tls_subheading,
  Data $tls_certfile,
  Data $tls_keyfile,
  Data $tls_cafile,
  Boolean $tls_no_verify,

  Boolean $manage_sasl_profile,
  Data $sasl_subheading,
  String $sasl_username,
  Data $sasl_password,
  Boolean $sasl_handshake_first,

  Boolean $manage_httpserver_profile,
  Data $httpserver_subheading,
  String $httpserver_address,
  Integer $httpserver_timeout,
  String $httpserver_tls,

  Boolean $manage_storage_profile,
  Data $storage_subheading,
  String $storage_class_name,
  Integer $storage_intervals,
  Integer $storage_expire_group,
  Integer $storage_workers,
  Integer $storage_min_distance,
  Data $storage_group_whitelist,

  Boolean $manage_evaluator_profile,
  Data $evaluator_subheading,
  String $evaluator_class_name,
  Integer $evaluator_expire_cache,
  Data $evaluator_minimum_complete,

  Boolean $manage_cluster_profile,
  Data $cluster_subheading,
  String $cluster_class_name,
  Array[String] $cluster_servers,
  String $cluster_client_profile,
  Integer $cluster_topic_refresh,
  Integer $cluster_offset_refresh,
  Boolean $manage_consumers,
  Array[Data] $consumers,
  Boolean $manage_notifiers,
  Array[Data] $notifiers,
){

  if empty($zookeeper_servers) {
    fail("You must set a value for zookeeper_servers!")
  } 

  if $manage_tls_profile {
    if empty($tls_certfile) or empty ($tls_keyfile) {
      fail("You must set a value for tls_certfile or tls_keyfile!")
    }
  }

  if $manage_sasl_profile {
    if empty($sasl_username) or empty ($sasl_password) {
      fail("You must set a value for sasl_username or sasl_password!")
    }
  }

  if $manage_httpserver_profile {
    if empty($httpserver_address) {
      fail("You must set a value for httpserver_address!")
    }
  }

  if $manage_storage_profile {
    if empty($storage_class_name) {
      fail("You must set a value for storage_class_name!")
    }
  }

  if $manage_evaluator_profile {
    if empty($evaluator_class_name) {
      fail("You must set a value for evaluator_class_name!")
    }
  }

  if $manage_cluster_profile {
    if empty($cluster_class_name) or empty($cluster_servers) {
      fail("You must set a value for cluster_class_name or cluster_servers!")
    }
  }

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
