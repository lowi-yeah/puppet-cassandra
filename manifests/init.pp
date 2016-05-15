class cassandra (
  $command                               = $cassandra::params::command,
  $config_path                           = $cassandra::params::config_path,
  $include_repo                          = $cassandra::params::include_repo,
  $repo_name                             = $cassandra::params::repo_name,
  $repo_base_url                         = $cassandra::params::repo_base_url,
  $repo_gpgkey                           = $cassandra::params::repo_gpgkey,
  $repo_repos                            = $cassandra::params::repo_repos,
  $repo_release                          = $cassandra::params::repo_release,
  $repo_pin                              = $cassandra::params::repo_pin,
  $repo_enabled                          = $cassandra::params::repo_enabled,
  $repo_gpgcheck                         = $cassandra::params::repo_gpgcheck,
  $package_ensure                        = $cassandra::params::package_ensure,
  $package_name                          = $cassandra::params::package_name,
  $service_autorestart                   = hiera('cassandra::service_autorestart', $cassandra::params::service_autorestart),
  $service_enable                        = hiera('cassandra::service_enable', $cassandra::params::service_enable),
  $service_ensure                        = $cassandra::params::service_ensure,
  $service_manage                        = hiera('cassandra::service_manage', $cassandra::params::service_manage),
  $service_name                          = $cassandra::params::service_name,
  $service_retries                       = $cassandra::params::service_retries,
  $service_startsecs                     = $cassandra::params::service_startsecs,
  $service_stderr_logfile_keep           = $cassandra::params::service_stderr_logfile_keep,
  $service_stderr_logfile_maxsize        = $cassandra::params::service_stderr_logfile_maxsize,
  $service_stdout_logfile_keep           = $cassandra::params::service_stdout_logfile_keep,
  $service_stdout_logfile_maxsize        = $cassandra::params::service_stdout_logfile_maxsize,
  $version                               = $cassandra::params::version,
  $max_heap_size                         = $cassandra::params::max_heap_size,
  $gid                                   = $cassandra::params::gid,
  $group                                 = $cassandra::params::group,
  $group_ensure                          = $cassandra::params::group_ensure,
  $shell                                 = $cassandra::params::shell,
  $uid                                   = $cassandra::params::uid,
  $user                                  = $cassandra::params::user,
  $user_description                      = $cassandra::params::user_description,
  $user_ensure                           = $cassandra::params::user_ensure,
  $user_home                             = $cassandra::params::user_home,
  $user_manage                           = hiera('cassandra::user_manage', $cassandra::params::user_manage),
  $user_managehome                       = hiera('cassandra::user_managehome', $cassandra::params::user_managehome),
  $heap_newsize                          = $cassandra::params::heap_newsize,
  $jmx_port                              = $cassandra::params::jmx_port,
  $additional_jvm_opts                   = $cassandra::params::additional_jvm_opts,
  $cluster_name                          = $cassandra::params::cluster_name,
  $listen_address                        = $cassandra::params::listen_address,
  $broadcast_address                     = $cassandra::params::broadcast_address,
  $authenticator                         = $cassandra::params::authenticator,
  $authorizer                            = $cassandra::params::authorizer,
  $rpc_address                           = $cassandra::params::rpc_address,
  $rpc_port                              = $cassandra::params::rpc_port,
  $rpc_server_type                       = $cassandra::params::rpc_server_type,
  $rpc_min_threads                       = $cassandra::params::rpc_min_threads,
  $rpc_max_threads                       = $cassandra::params::rpc_max_threads,
  $storage_port                          = $cassandra::params::storage_port,
  $partitioner                           = $cassandra::params::partitioner,
  $data_file_directories                 = $cassandra::params::data_file_directories,
  $commitlog_directory                   = $cassandra::params::commitlog_directory,
  $saved_caches_directory                = $cassandra::params::saved_caches_directory,
  $initial_token                         = $cassandra::params::initial_token,
  $seeds                                 = $cassandra::params::seeds,
  $default_concurrent_reads              = $cassandra::params::default_concurrent_reads,
  $concurrent_reads                      = $cassandra::params::concurrent_reads,
  $default_concurrent_writes             = $cassandra::params::default_concurrent_writes,
  $concurrent_writes                     = $cassandra::params::concurrent_writes,
  $incremental_backups                   = $cassandra::params::incremental_backups,
  $snapshot_before_compaction            = $cassandra::params::snapshot_before_compaction,
  $auto_snapshot                         = $cassandra::params::auto_snapshot,
  $multithreaded_compaction              = $cassandra::params::multithreaded_compaction,
  $endpoint_snitch                       = $cassandra::params::endpoint_snitch,
  $internode_compression                 = $cassandra::params::internode_compression,
  $disk_failure_policy                   = $cassandra::params::disk_failure_policy,
  $start_native_transport                = $cassandra::params::start_native_transport,
  $native_transport_port                 = $cassandra::params::native_transport_port,
  $start_rpc                             = $cassandra::params::start_rpc,
  $num_tokens                            = $cassandra::params::num_tokens,
  $thread_stack_size                     = $cassandra::params::thread_stack_size,
  $server_encryption_internode           = $cassandra::params::server_encryption_internode,
  $server_encryption_require_auth        = $cassandra::params::server_encryption_require_auth,
  $server_encryption_keystore            = $cassandra::params::server_encryption_keystore,
  $server_encryption_keystore_password   = $cassandra::params::server_encryption_keystore_password,
  $server_encryption_truststore          = $cassandra::params::server_encryption_truststore,
  $server_encryption_truststore_password = $cassandra::params::server_encryption_truststore_password,
  $server_encryption_cipher_suites       = $cassandra::params::server_encryption_cipher_suites,
  $client_encryption_enabled             = $cassandra::params::client_encryption_enabled,
  $client_encryption_require_auth        = $cassandra::params::client_encryption_require_auth,
  $client_encryption_keystore            = $cassandra::params::client_encryption_keystore,
  $client_encryption_keystore_password   = $cassandra::params::client_encryption_keystore_password,
  $client_encryption_truststore          = $cassandra::params::client_encryption_truststore,
  $client_encryption_truststore_password = $cassandra::params::client_encryption_truststore_password,
  $client_encryption_cipher_suites       = $cassandra::params::client_encryption_cipher_suites,
  $dc                                    = $cassandra::params::dc,
  $rack                                  = $cassandra::params::rack,
  $dc_suffix                             = $cassandra::params::dc_suffix,
  $prefer_local                          = $cassandra::params::prefer_local,
  $cassandra_user_shell                  = $cassandra::params::cassandra_user_shell,                                       

) inherits cassandra::params {
  validate_string($command)
  validate_absolute_path($config_path)
  validate_bool($include_repo)
  validate_string($repo_name)
  # $repo_base_url
  # $repo_gpgkey
  # $repo_repos
  # $repo_release
  # $repo_pin
  # $repo_enabled
  # $repo_gpgcheck
  validate_string($package_ensure)
  validate_string($package_name)
  validate_bool($service_autorestart)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  if !is_integer($service_retries) { fail('The $service_retries parameter must be an integer number') }
  if !is_integer($service_startsecs) { fail('The $service_startsecs parameter must be an integer number') }
  if !is_integer($service_stderr_logfile_keep) {fail('The $service_stderr_logfile_keep parameter must be an integer number')}
  validate_string($service_stderr_logfile_maxsize)
  if !is_integer($service_stdout_logfile_keep) {fail('The $service_stdout_logfile_keep parameter must be an integer number')}
  validate_string($service_stdout_logfile_maxsize)
  validate_re($version, '\d*\.\d*', 'The version should be x.y')
  # validate_string($max_heap_size)
  if !is_integer($gid) { fail('The $gid parameter must be an integer number') }
  validate_string($group)
  validate_string($group_ensure)
  validate_absolute_path($shell)
  if !is_integer($uid) { fail('The $uid parameter must be an integer number') }
  validate_string($user)
  validate_string($user_description)
  validate_string($user_ensure)
  validate_absolute_path($user_home)
  validate_bool($user_manage)
  validate_bool($user_managehome)
  # $heap_newsize
   if(!is_integer($jmx_port)) { fail('jmx_port must be a port number between 1 and 65535') }
  validate_array($additional_jvm_opts)
  validate_string($cluster_name)
  if(!is_ip_address($listen_address)) { fail('listen_address must be an IP address') }
  if(!empty($broadcast_address) and !is_ip_address($broadcast_address)) { fail('broadcast_address must be an IP address') }
  # $authenticator
  # $authorizer
  if(!is_ip_address($rpc_address)) { fail('rpc_address must be an IP address') }
  if(!is_integer($rpc_port)) { fail('rpc_port must be a port number between 1 and 65535') }
  # $rpc_server_type
  if(!is_integer($rpc_min_threads)) { fail('rpc_min_threads must be a nonnegative integer') }
  if(!is_integer($rpc_max_threads)) { fail('rpc_max_threads must be a nonnegative integer') }
  if(!is_integer($storage_port)) { fail('storage_port must be a port number between 1 and 65535') }
  validate_string($partitioner)
  validate_array($data_file_directories)
  validate_absolute_path($commitlog_directory)
  validate_absolute_path($saved_caches_directory)
  validate_string($initial_token)
  validate_array($seeds)
  # $default_concurrent_reads
  validate_re("${concurrent_reads}", '^[0-9]+$')
  # $default_concurrent_writes
  validate_re("${concurrent_writes}", '^[0-9]+$')
  validate_re($incremental_backups, '^(true|false)$')
  validate_re($snapshot_before_compaction, '^(true|false)$')
  validate_re($auto_snapshot, '^(true|false)$')
  validate_re($multithreaded_compaction, '^(true|false)$')
  validate_string($endpoint_snitch)
  validate_re($internode_compression, '^(all|dc|none)$')
  validate_re($disk_failure_policy, '^(stop|best_effort|ignore)$')
  validate_re($start_native_transport, '^(true|false)$')
  if(!is_integer($native_transport_port)) { fail('native_transport_port must be a port number between 1 and 65535') }
  validate_re($start_rpc, '^(true|false)$')
  validate_re("${num_tokens}", '^[0-9]+$')
  validate_re("${thread_stack_size}", '^[0-9]+$')
  validate_re($server_encryption_internode, '^all|none|dc|rack$')
  # $server_encryption_require_auth
  validate_string($server_encryption_keystore)
  validate_string($server_encryption_keystore_password)
  validate_string($server_encryption_truststore)
  validate_string($server_encryption_truststore_password)
  validate_array($server_encryption_cipher_suites)
  validate_bool($client_encryption_enabled)
  validate_bool($client_encryption_require_auth)
  validate_string($client_encryption_keystore)
  validate_string($client_encryption_keystore_password)
  validate_string($client_encryption_truststore)
  validate_string($client_encryption_truststore_password)
  validate_array($client_encryption_cipher_suites)
  # $dc
  # $rack
  # $dc_suffix
  # $prefer_local
  validate_string($cassandra_user_shell)
  
  if(empty($seeds)) { fail('seeds must not be empty') }
  if(empty($data_file_directories)) { fail('data_file_directories must not be empty') }
  if(!empty($initial_token)) { notice("Starting with Cassandra 1.2 you shouldn't set an initial_token but set num_tokens accordingly.") }
  # validate_string($config_template)

  include '::cassandra::users'
  include '::cassandra::install'
  include '::cassandra::config'
  include '::cassandra::service'

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up. You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'cassandra::begin': }
  anchor { 'cassandra::end': }

  Anchor['cassandra::begin']
  -> Class['::cassandra::users']
  -> Class['::cassandra::install']
  -> Class['::cassandra::config']
  ~> Class['::cassandra::service']
  -> Anchor['cassandra::end']
}
