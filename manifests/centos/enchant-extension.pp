class php::centos::enchant-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-enchant':
            name => "${php::centos::config::php_prefix}-enchant-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}