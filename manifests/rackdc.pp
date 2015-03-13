class cassandra::rackdc (
  $dc           = $::cassandra::params::dc,
  $rack         = $::cassandra::params::rack,
  $dc_suffix    = $::cassandra::params::dc_suffix,
  $prefer_local = $::cassandra::params::prefer_local,
) inherits cassandra::params {
    file { "${config_path}/cassandra-rackdc.properties":
      ensure  => file,
      content => template("${module_name}/cassandra-rackdc.properties.erb"),
    }
}
