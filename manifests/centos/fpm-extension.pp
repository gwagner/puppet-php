class php::centos::fpm-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-fpm':
            name => "${php::centos::config::php_prefix}-fpm-${php::centos::config::php_version}":
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}