class php::centos::tidy-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-tidy':
            name => "${php::centos::config::php_prefix}-tidy-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies,;
    }
}