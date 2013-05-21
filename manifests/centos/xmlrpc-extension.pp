class php::centos::xmlrpc-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-xmlrpc':
            name => "${php::centos::config::php_prefix}-xmlrpc-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}