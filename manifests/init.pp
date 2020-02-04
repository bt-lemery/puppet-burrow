# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param example
#   include burrow
#
# @param version
#   Version of the burrow package to install.  Defaults to 1.3.2.
#
# @param user
#   User for file ownership/service.  Defaults to 'root'.
#
# @param group
#   Group for file ownership/service. Defaults to 'root'.
#
# @param config_file
#   Path and name for burrow config file.  Defaults to '/etc/burrow/config'.
#
# @param pidfile
#   The path and filename to store the PID of the running process in. Defaults to '/var/run/burrow.pid'.
#
# @param stdout_logfile
#   If specified, it is the path and filename to redirect stdout and stderr into. If not specified, stdout/stderr are not redirected.  Defaults to ''.
#
# @param access_control_allow_origin
#   The value to put in the Access-Control-Allow-Origin header in responses from the HTTP server in Burrow. Defaults to ''.
#
# @param logging_file
#   The path and filename to write logs to. If not specified, logs are written to stdout. Defaults to ''.
#
# @param logging_level
#   	The minimum log level to output. Must be one of "debug", "info", "warn", "error", "panic", "fatal".  Defaults to 'info'.
#
# @param logging_maxsize
#   The maximum size for a log file, in MB. Defaults to 100.
#
# @param logging_maxbackups
#   The maximum number of log files to maintain. Defaults to 10.
#
# @param logging_maxage
#   The maximum number of days to keep log files for. Defaults to 30.
#
# @param logging_use_localtime
#   If true, write log entries using the system's local time. Otherwise, use UTC.  Defaults to false.
#
# @param logging_use_compression
#   If true, compress rotated log files. Defaults to false.
#
# @param zookeeper_servers
#   An array of strings in the form "hostname:port" that point to the servers in the Zookeeper ensemble. At least one is required.
#
# @param zookeeper_timeout
#   The expiration timeout for Zookeeper sessions, in seconds. Defaults to 6.
#
# @param zookeeper_root_path
#   A full path to the znode that Burrow is allow to write under. The path will be created if it does not already exist.  Defaults to '/burrow/notifier'.
#
# @param manage_client_profile
#   Whether to use this module to manage a client profile.  Defaults to false.
#
# @param client_subheading
#   Unique subheading name for client profile.  Defaults to 'myclient'.
#
# @param client_kafka_version
#   The client version of Kafka to support.
#   Valid versions are: 0.8, 0.8.0, 0.8.1, 0.8.2, 0.9, 0.9.0, 0.9.0.0, 0.9.0.1, 0.10, 0.10.0, 0.10.0.0, 0.10.0.1, 0.10.1, 0.10.1.0, 0.10.2, 0.10.2.0, 0.11.0,
#   0.11.0.1, 0.11.0.2, 1.0.0, 1.0.1, 1.0.2, 1.1.0, 1.1.1.  Defaults to 0.8.
#
# @param client_id
#   A string to be passed to Kafka as the client ID.  Defaults to 'burrow-lagchecker'.
#
# @param client_tls
#   If specified, it is the name of a TLS profile to use in this client configuration.  Defaults to ''.
#
# @param client_sasl
#   If specified, it is the name of a SASL profile to use in this client configuration.  Defaults to ''.
#
# @param manage_tls_profile
#   Whether to use this module to manage a TLS profile.  Defaults to false.
#
# @param tls_subheading
#   Unique subheading name for TLS profile.  Defaults to 'mytlsprofile'.
#
# @param tls_certfile
#   The path to the certificate file to be used (either a client certificate for client connections, or a server certificate for the HTTP server).
#   Required if using this module to manage a TLS profile.
#
# @param tls_keyfile
#   The path to the key file that matches the certfile.  Defaults to ''.  Required if using this module to manage a TLS profile.
#
# @param tls_cafile
#   If specified, it is the path to a bundle of certificates that provide the trusted root certificates for the connection.  Defaults to ''.
#
# @param tls_no_verify
#   	If true, do not validate the trust of the certificate sent by the other side of this connection.  Defaults to false.
# @param manage_sasl_profile
#   Whether to use this module to manage a TLS profile.  Defaults to false.
#
# @param sasl_subheading
#   Unique subheading name for TLS profile.  Defaults to 'mysaslprofile'.
#
# @param sasl_username
#   The username to use for authentication. Required if using this module to manage a SASL profile.
#
# @param sasl_password
#   The password to use for authentication. Required if using this module to manage a SASL profile.
#
# @param sasl_handshake_first
#   If false, do not send SASL handshake first (only used for Sarama connections to Kafka when using a non-Kafka proxy).  Defaults to true.
#
# @param manage_httpserver_profile
#   Whether to use this module to configure the HTTP server in Burrow.  Defaults to false.
#
# @param httpserver_subheading
#   Unique subheading name for HTTP server.  Defaults to 'mylistener'.
#
# @param httpserver_address
#   This is a string of the form ip:port that specifies what the server should listen on. If the ip part is left blank, the listener attaches to
#   all IPs on the host. If the port part is left blank, a random port is chosen.  Required if using this module to manage the HTTP server in Burrow.
#
# @param httpserver_timeout
#   The timeout and keepalive setting for connections, in seconds.  Defaults to 300.
#
# @param httpserver_tls
#   If specified, it must be the name of a configured TLS profile and the listener is started with this configuration. Defaults to ''.
#
# @param manage_storage_profile
#   Whether to use this module to manage a storage profile.  Defaults to false.
#
# @param storage_subheading
#   Unique subheading name for storage profile.  Defaults to 'mystorage'.
#
# @param storage_class_name
#   This is the name of the module type. The only permitted value is "inmemory".
#
# @param storage_intervals
#   The number of offsets to store for each partition.  Defaults to 10.
#
# @param storage_expire_group
#   The number of seconds after which a group will be purged if it has not committed offsets.  Defaults to 604800.
#
# @param storage_workers
#   The number of worker goroutines to start up. This number can be increased to provide more parallelism in the storage module.  Defaults to 20.
#
# @param storage_min_distance
#   Coalesce offset commits that are more frequent than this number of seconds. Used with the intervals configuration, this can be used to set a minimum
#   time for the offset window (10 offsets x 15s = 150s minimum window).  Defaults to 0.
#
# @param storage_group_whitelist
#   If specified, ignore data for groups that do not match the regular expression.  Defaults to ''.
#
# @param manage_evaluator_profile
#   Whether to use this module to configure the evaluator subsystem.  Defaults to false.
#
# @param evaluator_subheading
#   Unique subheading name for evaluator subsystem.  Defaults to 'myeval'.
#
# @param evaluator_class_name
#   This is the name of the module type. The only permitted value is "caching".
#
# @param evaluator_expire_cache
#   The number of seconds to cache evaluation results for.  Defaults to 604800.
#
# @param evaluator_minimum_complete
#   A minimum threshold for completeness for evaluating partitions: any partition which has a completeness below this value will be marked as OK without evaluating it.
#   Defaults to '0.0'
#
# @param manage_cluster_profile
#   It is not required to specify a cluster profile, but if you don't you won't have Burrow doing any work.  Defaults to true.
#
# @param cluster_subheading
#   Unique subheading name for cluster profile.  Defaults to 'mycluster'.
#
# @param cluster_class_name
#   Name of cluster module. The only permitted value is 'kafka'.
#
# @param cluster_servers
#   An array of strings in the form "hostname:port" that point to the servers in the Kafka cluster. At least one is required.
#
# @param cluster_client_profile
#   The name of a configured client-profile section. If no profile is specified, a default configuration for the client will be used. Defaults to ''.
#
# @param cluster_topic_refresh
#   How often to refresh the list of all topics in the cluster, in seconds. Defaults to 60.
#
# @param cluster_offset_refresh
#   How often to refresh the broker offset for each partition, in seconds. Defaults to 10.
#
# @param manage_consumers
#   It is not required to specify this section, but if you don't you won't have Burrow doing much work. Defaults to true.
#
# @param consumers
#   An array of consumers.
#
# @param manage_notifiers
#   Defaults to false.
#
# @param notifiers
#   An array of notifiers.
#
class burrow (
  String $version,
  String $user,
  String $group,
  String $config_file,
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
    if empty($cluster_servers) {
      fail("You must set a value for cluster_servers!")
    }
  }

  class{'burrow::install':
    version => $version,
  }

  class { 'burrow::config':
    config_file                 => $config_file,
    user                        => $user,
    group                       => $group,
    pidfile                     => $pidfile,
    stdout_logfile              => $stdout_logfile,
    access_control_allow_origin => $access_control_allow_origin,
    logging_filename            => $logging_filename,
    logging_level               => $logging_level,
    logging_maxsize             => $logging_maxsize,
    logging_maxbackups          => $logging_maxbackups,
    logging_maxage              => $logging_maxage,
    logging_use_localtime       => $logging_use_localtime,
    logging_use_compression     => $logging_use_compression,
    zookeeper_servers           => $zookeeper_servers,
    zookeeper_timeout           => $zookeeper_timeout,
    zookeeper_root_path         => $zookeeper_root_path,
    manage_client_profile       => $manage_client_profile,
    client_subheading           => $client_subheading,
    client_kafka_version        => $client_kafka_version,
    client_id                   => $client_id,
    client_tls                  => $client_tls,
    client_sasl                 => $client_sasl,
    manage_tls_profile          => $manage_tls_profile,
    tls_subheading              => $tls_subheading,
    tls_certfile                => $tls_certfile,
    tls_keyfile                 => $tls_keyfile,
    tls_cafile                  => $tls_cafile,
    tls_no_verify               => $tls_no_verify,
    manage_sasl_profile         => $manage_sasl_profile,
    sasl_subheading             => $sasl_subheading,
    sasl_username               => $sasl_username,
    sasl_password               => $sasl_password,
    sasl_handshake_first        => $sasl_handshake_first,
    manage_httpserver_profile   => $manage_httpserver_profile,
    httpserver_subheading       => $httpserver_subheading,
    httpserver_address          => $httpserver_address,
    httpserver_timeout          => $httpserver_timeout,
    httpserver_tls              => $httpserver_tls,
    manage_storage_profile      => $manage_storage_profile,
    storage_subheading          => $storage_subheading,
    storage_class_name          => $storage_class_name,
    storage_intervals           => $storage_intervals,
    storage_expire_group        => $storage_expire_group,
    storage_workers             => $storage_workers,
    storage_min_distance        => $storage_min_distance,
    storage_group_whitelist     => $storage_group_whitelist,
    manage_evaluator_profile    => $manage_evaluator_profile,
    evaluator_subheading        => $evaluator_subheading,
    evaluator_class_name        => $evaluator_class_name,
    evaluator_expire_cache      => $evaluator_expire_cache,
    evaluator_minimum_complete  => $evaluator_minimum_complete,
    manage_cluster_profile      => $manage_cluster_profile,
    cluster_subheading          => $cluster_subheading,
    cluster_class_name          => $cluster_class_name,
    cluster_servers             => $cluster_servers,
    cluster_client_profile      => $cluster_client_profile,
    cluster_topic_refresh       => $cluster_topic_refresh,
    cluster_offset_refresh      => $cluster_offset_refresh,
    manage_consumers            => $manage_consumers,
    consumers                   => $consumers,
    manage_notifiers            => $manage_notifiers,
    notifiers                   => $notifiers,
  }
  contain 'burrow::config'

  class { 'burrow::service':
  }

  Class['burrow::install']
  -> Class['burrow::config']
  ~> Class['burrow::service']

}
