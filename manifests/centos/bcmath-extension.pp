class php::centos::bcmath-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-bcmath':
            name => "${php::centos::config::php_prefix}-bcmath-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}