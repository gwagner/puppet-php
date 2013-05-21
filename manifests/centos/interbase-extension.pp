class php::centos::interbase-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-interbase':
            name => "${php::centos::config::php_prefix}-interbase-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}