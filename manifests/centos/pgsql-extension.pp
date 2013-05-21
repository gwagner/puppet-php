class php::centos::pgsql-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-pgsql':
            name => "${php::centos::config::php_prefix}-pgsql-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}