class php::centos::pgsql84-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-pgsql84':
            name => "${php::centos::config::php_prefix}-pgsql84-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}