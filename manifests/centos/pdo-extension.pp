class php::centos::pdo-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-pdo':
            name => "${php::centos::config::php_prefix}-pdo-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}