define postfix::config($ensure = 'present', $value) {
  $changes = $ensure ? {
    'absent' => "rm ${name}",
    default  => "set ${name} ${value}",
  }

  augeas { "set postfix ${name} to ${value}":
    context => '/files/etc/postfix/main.cf',
    changes => $changes,
    notify  => Service['postfix'],
    require => File['/etc/postfix/main.cf'],
  }
}