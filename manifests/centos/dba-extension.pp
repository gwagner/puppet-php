class php::centos::dba-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-dba':
            name => "${php::centos::config::php_prefix}-dba-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}