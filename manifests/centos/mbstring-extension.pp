class php::centos::mbstring-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-mbstring':
            name => "${php::centos::config::php_prefix}-mbstring-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}