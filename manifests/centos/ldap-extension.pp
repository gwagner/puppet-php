class php::centos::ldap-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-ldap':
            name => "${php::centos::config::php_prefix}-ldap-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}