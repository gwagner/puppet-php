class php::centos::memcache-extension
{
    include php::centos::config, repo_epel, repo_ius

    package
    {
        ['libmemcached', 'libmemcached-devel']:
            ensure => installed,
            provider => 'yum',
            require => [Yumrepo['epel']];

        'php-ext-memcache':
            name => "${php::centos::config::php_prefix}-pecl-memcache-${php::centos::config::memcache_version}",
            ensure => installed,
            provider => 'yum',
            require => [
                Package[
                    "${php::centos::config::php_prefix}-pear-${php::centos::config::php_pear_version}",
                    'libmemcached',
                    'libmemcached-devel'
                ]
            ];
    }

    file
    {
        'memcache-extension-ini':
            mode => 644,
            owner => "root",
            group => "root",
            path => "/etc/php.d/memcache.ini",
            content => template('php/centos/memcache-extension-ini.erb'),
            require => [
                Package["${php::centos::config::php_prefix}-common-${php::centos::config::php_version}"],
                Package["${php::centos::config::php_prefix}-devel-${php::centos::config::php_version}"],
                File['/etc/php.d']
            ];
    }
}