class php::ubuntu::base
{
    require php::ubuntu::config

    apt::ppa { "ppa:ondrej/php5": }

    package
    {
        "php5-common":
            ensure => installed,
            provider => 'apt',
            require => [
                Apt::Ppa['ppa:ondrej/php5']
            ],
            alias => 'php-common';

        "php5-cli":
            ensure => installed,
            provider => 'apt',
            require => [
                Package['php-common'],
                Apt::Ppa['ppa:ondrej/php5']
            ],
            alias => 'php-cli';

        "php5-dev":
            ensure => installed,
            provider => 'apt',
            require => [
                Package['php-common', 'php-cli'],
                Apt::Ppa['ppa:ondrej/php5']
            ],
            alias => 'php-devel';
    }

    file{
        'php-ini':
            mode => 644,
            owner => "root",
            group => "root",
            path => "/etc/php5/cli/php.ini",
            content => template('php/ubuntu/php-ini.erb'),
            require => [
                Package["php-cli"]
            ];
    }
}