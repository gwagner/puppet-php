class php::centos::gd-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-gd':
            name => "${php::centos::config::php_prefix}-gd-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}