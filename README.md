# burrow

This module will install and configure LinkedIn's Burrow.  It assumes an RPM is available (will support archive-based installations at a later date).

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with burrow](#setup)
    * [What burrow affects](#what-burrow-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with burrow](#beginning-with-burrow)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Install and configure Burrow.

## Setup

### What burrow affects

Currently, this module will install Burrow from an RPM and customize a config file.  Later we will support an archive-based installation and the ability to run Burrow as a service.

### Setup Requirements

This module assumes you have an RPM of Burrow available.

### Beginning with burrow

You should be able to use this module to install and config Burrow with a minimal set of parameters:

```
class {'::burrow':
  zookeeper_servers      => '[ \'localhost:2081\', \'localhost:2082\', \'localhost:2083\', ]',
  manage_cluster_profile => true,
  cluster_servers        => '[ \'localhost:3000\', \'localhost:3001\', ]',
   manage_consumers      => true,
   consumers             => [
     {
       'subheading'      => 'local',
       'class-name'      => 'kafka',
       'cluster'         => 'foo',
       'servers'         => [ 'localhost:3001', 'localhost:3001' ],
       'group-blacklist' => "^(console-consumer-|python-kafka-consumer-|quick-).*$",
       'group-whitelist' => "",
       'client-profile'  => "test",
     },
   ],
}
```

## Usage

A complex example:

```
 class { '::burrow':
   version                   => '1.3.2',
   zookeeper_servers         => '[ \'localhost:2081\', \'localhost:2082\', \'localhost:2083\', ]',
   manage_client_profile     => true,
   manage_tls_profile        => true,
   tls_certfile              => '/etc/pki/tls/mycert.cert',
   tls_keyfile               => '/etc/pki/tls/private/mykey.key',
   manage_sasl_profile       => true,
   sasl_username             => 'myuser',
   sasl_password             => 'secret',
   manage_httpserver_profile => true,
   httpserver_address        => ':8080',
   manage_storage_profile    => true,
   manage_evaluator_profile  => true,
   manage_cluster_profile    => true,
   cluster_servers           => '[ \'localhost:3000\', \'localhost:3001\', ]',
   manage_consumers          => true,
   consumers                 => [
     {
       'subheading'      => 'local',
       'class-name'      => 'kafka',
       'cluster'         => 'foo',
       'servers'         => [ 'localhost:3001', 'localhost:3001' ],
       'group-blacklist' => "^(console-consumer-|python-kafka-consumer-|quick-).*$",
       'group-whitelist' => "",
       'client-profile'  => "test",
     },
     {
       'subheading'        => 'local_zk',
       'class-name'        => 'kafka_zk',
       'cluster'           => 'foo',
       'servers'           => [ 'localhost:2081', 'localhost:2082', 'localhost:2083', ],
       'group-blacklist'   => "^(console-consumer-|python-kafka-consumer-|quick-).*$",
       'group-whitelist'   => "",
       'zookeeper-path'    => "/kafka-cluster",
       'zookeeper-timeout' => 30,
     },
   ],
   manage_notifiers          => true,
   notifiers                 => [
     {
       'subheading'      => 'tellme',
       'class-name'      => 'http',
       'interval'        => 60,
       'threshold'       => 2,
       'group-whitelist' => "",
       'group-blacklist' => "^not-this-group$",
       'extras'          => "{ api_key=\"REDACTED\", app=\"burrow\", tier=\"STG\", fabric=\"mydc\" }",
       'send-close'      => false,
       'template-open'   => '/etc/burrow/default-http-post.tmpl',
       'template-close'  => '/etc/burrow/default-http-delete.tmpl',
       'url-open'        => "http://someservice.example.com:1467/v1/event",
       'method-open'     => "POST",
       'method-close'    => "DELETE",
       'timeout'         => 5,
       'keepalive'       => 30,
     },
     {
       'subheading'      => 'emailme',
       'class-name'      => 'email',
       'interval'        => 60,
       'threshold'       => 3,
       'group-whitelist' => "^important-group-prefix.*$",
       'group-blacklist' => "^not-this-group$",
       'extras'          => "{ key1=\"value1\", key2=\"value2\" }",
       'send-close'      => false,
       'template-open'   => '/etc/burrow/default-email-open.tmpl',
       'template-close'  => '/etc/burrow/default-email-close.tmpl',
       'server'          => 'smtp.example.org',
       'port'            => 25,
       'from'            => 'notifier@example.org',
       'to'              => 'notifications@example.org',
       'auth-type'       => 'plain',
       'username'        => 'kafka',
       'password'        => 'secret',
     },
   ],
   manage_service            => true,
 }
```
