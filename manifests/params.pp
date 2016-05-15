#
# == Class cassandra::params
class cassandra::params {
  $command             = 'service cassandra start'
  $config_path         = '/etc/cassandra/conf'
  $include_repo        = true
  $repo_name           = 'DataStax Repo for Apache Cassandra'
  $repo_base_url       = 'http://rpm.datastax.com/community'
  $repo_gpgkey         = 'http://rpm.datastax.com/rpm/repo_key'
  $repo_repos          = 'main'
  $repo_release        = 'stable'
  $repo_pin            = 200
  $repo_enabled        = 1
  $repo_gpgcheck       = 0
  $package_ensure      = 'present'
  $package_name        = 'dsc21'
  $service_autorestart = true
  $service_enable      = true
  $service_ensure      = 'present'
  $service_manage      = true
  $service_name        = 'cassandra'
  $service_retries     = 999
  $service_startsecs   = 10
  $service_stderr_logfile_keep    = 10
  $service_stderr_logfile_maxsize = '20MB'
  $service_stdout_logfile_keep    = 5
  $service_stdout_logfile_maxsize = '20MB'
  $version             = '3.5'
  $max_heap_size       = ''
  $gid                 = 53064
  $group               = 'cassandra'
  $group_ensure        = 'present'
  $shell               = '/bin/bash'
  $uid                 = 53064
  $user                = 'cassandra'
  $user_description    = 'Cassandra system account'
  $user_ensure         = 'present'
  $user_home           = '/home/cassandra'
  $user_manage         = true
  $user_managehome     = true
  $heap_newsize =  ''
  $jmx_port =  7199
  $additional_jvm_opts = []
  $cluster_name = 'Cassandra'
  $listen_address =  $::ipaddress
  $broadcast_address = ''
  $authenticator = 'AllowAllAuthenticator'
  $authorizer = 'AllowAllAuthorizer'
  $rpc_address = '0.0.0.0'
  $rpc_port = 9160
  $rpc_server_type = 'hsha'
  $rpc_min_threads = 0
  $rpc_max_threads = 2048
  $storage_port = 7000
  $partitioner = 'org.apache.cassandra.dht.Murmur3Partitioner'
  $data_file_directories = ['/var/lib/cassandra/data']
  $commitlog_directory = '/var/lib/cassandra/commitlog'
  $saved_caches_directory = '/var/lib/cassandra/saved_caches'
  $initial_token = ''
  $seeds = []
  # $default_concurrent_reads = $::processorcount * 
  $default_concurrent_reads = 1
  $concurrent_reads = $default_concurrent_reads
  # $default_concurrent_writes = $::processorcount * 
  $default_concurrent_writes = 1
  $concurrent_writes = $default_concurrent_writes
  $incremental_backups = 'false'
  $snapshot_before_compaction = 'false'
  $auto_snapshot = 'true'
  $multithreaded_compaction = 'false'
  $endpoint_snitch = 'SimpleSnitch'
  $internode_compression = 'all'
  $disk_failure_policy = 'stop'
  $start_native_transport = 'true'
  $native_transport_port = 9042
  $start_rpc = 'true'
  $num_tokens = 256
  $thread_stack_size = 256
  $server_encryption_internode =  'none'
  $server_encryption_require_auth = false
  $server_encryption_keystore = ''
  $server_encryption_keystore_password = ''
  $server_encryption_truststore = ''
  $server_encryption_truststore_password = ''
  $server_encryption_cipher_suites = []
  $client_encryption_enabled = false
  $client_encryption_require_auth = false
  $client_encryption_keystore = ''
  $client_encryption_keystore_password = ''
  $client_encryption_truststore = ''
  $client_encryption_truststore_password = ''
  $client_encryption_cipher_suites =  []
  $dc =  'DC1'
  $rack = 'RAC1'
  $dc_suffix = ''
  $prefer_local = ''
  $cassandra_user_shell = '/bin/false'

  case $::osfamily {
    'RedHat': {}
    default: {
      fail("The ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
