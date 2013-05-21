class php::centos::mysqlnd-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-mysqlnd':
            name => "${php::centos::config::php_prefix}-mysqlnd-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}