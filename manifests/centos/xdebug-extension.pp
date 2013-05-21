class php::centos::xdebug-extension
{
    require php::centos::config, php::centos::pear-extension, repo_ius

    package {
        'php-ext-xdebug':
            name => "${php::centos::config::php_prefix}-pecl-xdebug-${php::centos::config::php_xdebug_version}",
            ensure => installed,
            provider => 'yum',
            require => [
                $php::centos::config::extension_dependencies,
                Package["${php::centos::config::php_prefix}-pear-${php::centos::config::php_pear_version}"]
            ];

    }
}