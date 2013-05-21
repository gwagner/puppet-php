class php::centos::ioncube-loader-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-ioncube':
            name => "${php::centos::config::php_prefix}-ioncube-loader-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}