class puppet {
  file { '/usr/local/bin/papply' :
  source => 'puppet:///modules/puppet/papply.sh',
  mode   => '0755',
  }

  file { '/usr/local/bin/pull-updates.sh':
  source => 'puppet:///modules/puppet/pull-updates.sh',
  mode   => '0755',
  }

  file { '/home/stefan/.ssh/id_rsa' :
  source => 'puppet:///modules/puppet/stefan.priv',
  owner  => 'stefan',
  mode   => '0600',
  }
file { '/home/stefan/.ssh/id_rsa.pub' :
  source => 'puppet:///modules/puppet/stefan.pub',
  owner  => 'stefan',
  mode   => '0600',
  }

  cron { 'run-puppet':
  ensure  => 'present',
  user    => 'stefan',
  command => '/usr/local/bin/pull-updates',
  minute => '*/10',
  hour    => '*',
  }
}
