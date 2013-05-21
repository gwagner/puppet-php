class php::centos::mcrypt-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-mcrypt':
            name => "${php::centos::config::php_prefix}-mcrypt-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}