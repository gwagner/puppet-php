class php::centos::intl-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-intl':
            name => "${php::centos::config::php_prefix}-intl-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}