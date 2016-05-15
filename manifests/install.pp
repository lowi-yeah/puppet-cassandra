# == Class cassandra::install
#
class cassandra::install inherits cassandra {

  yumrepo { 'cassandra::repo':
    # repo_name => $repo_name,
    baseurl   => $repo_baseurl,
    # key_id    => $repo_key_id,
    gpgkey    => $repo_gpgkey,
    # repos     => $repo_repos,
    # release   => $repo_release,
    # pin       => $repo_pin,
    gpgcheck  => $repo_gpgcheck,
    enabled   => $repo_enabled,
  }

  package { 'dsc':
    ensure  => $version,
    name    => $package_name,
    require => Yumrepo['cassandra::repo']
  }

  package { 'python26-cql':
    ensure => installed,
  }
  
}
