define asterisk::account::sip (
  $ensure = 'present',

  $secret  = false,
  $context = false,

  $account_type = 'friend',
  $canreinvite = 'no',
  $host = 'dynamic',
  $insecure = 'no',
  $language = 'en',
  $nat = 'no',
  $qualify = '1000',
  $vmexten = '*97',

  $callerid = false,
  $calllimit = false,
  $callgroup = false,
  $mailbox = false,
  $md5secret = false,
  $pickupgroup = false) {

  file {"/etc/asterisk/sip.conf.d/${name}.conf":
    ensure  => $ensure,
    content => template("asterisk/account-sip.erb"),
    notify  => Exec["asterisk-reload"],
    owner   => "root",
    group   => "asterisk",
    mode    => "640",
    require => File["/etc/asterisk/sip.conf.d"],
  }
}