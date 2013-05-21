class php::centos::snmp-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-snmp':
            name => "${php::centos::config::php_prefix}-snmp-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}