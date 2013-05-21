class php::centos::soap-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-soap':
            name => "${php::centos::config::php_prefix}-soap-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}