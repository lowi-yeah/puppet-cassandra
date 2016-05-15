# == Class cassandra::config
#
class cassandra::config inherits cassandra {

  file { $data_file_directories:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    require => Class['cassandra::install'],
  }

  file { "${config_path}/cassandra-env.sh":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    content => template("${module_name}/cassandra-env${version}.sh.erb"),
    require => Class['cassandra::install'],
  }
  file { "${config_path}/cassandra.yaml":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    content => template("${module_name}/cassandra${version}.yaml.erb"),
    require => Class['cassandra::install'],
  }
}
