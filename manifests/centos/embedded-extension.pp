class php::centos::embedded-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-embedded':
            name => "${php::centos::config::php_prefix}-embedded-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}