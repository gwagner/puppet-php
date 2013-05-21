class php::base-ubuntu
{
    require php::config_ubuntu

    package
    {
        "php5-common":
            ensure => installed,
            provider => 'apt',
            alias => 'php-common';

        "php5-cli":
            ensure => installed,
            provider => 'apt',
            require => [
                Package['php-common']
            ],
            alias => 'php-cli';

        "${php::config::php_prefix}-devel-${php::config::php_version}":
            ensure => installed,
            provider => 'yum',
            require => [
                Yumrepo['ius'],
                Yumrepo['ius-development'],
                Package['re2c'],
                Package['gcc'],
                Package["php-common"],
                Package["php-cli"],
            ],
            alias => 'php-devel';
    }

    file{
        'php-ini':
            mode => 644,
            owner => "root",
            group => "root",
            path => "/etc/php.ini",
            content => template('php/php-ini.erb'),
            require => [
                Package["php-cli"]
            ];
        '/etc/php.d':
            ensure => 'directory',
            mode   => 0644,
            owner  => 'root',
            group  => 'root';
    }
}