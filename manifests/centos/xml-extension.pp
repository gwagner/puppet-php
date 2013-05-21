class php::centos::xml-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-xml':
            name => "${php::centos::config::php_prefix}-xml-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}