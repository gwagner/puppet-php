class php::centos::mysql-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-mysql':
            name => "${php::centos::config::php_prefix}-mysql-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}