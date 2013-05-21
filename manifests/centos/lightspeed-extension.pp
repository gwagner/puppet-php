class php::centos::lightspeed-extension
{
    require php::centos::config, repo_ius

    package {
         'php-ext-lightspeed':
            name => "${php::centos::config::php_prefix}-lightspeed-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}