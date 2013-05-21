class php::centos::pear-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-pear':
            name => "${php::centos::config::php_prefix}-pear-${php::centos::config::php_pear_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}