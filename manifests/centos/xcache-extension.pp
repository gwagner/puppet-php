class php::centos::xcache-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-xcache':
            name => "${php::centos::config::php_prefix}-xcache-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}