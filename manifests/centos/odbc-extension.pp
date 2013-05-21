class php::centos::odbc-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-odbc':
            name => "${php::centos::config::php_prefix}-odbc-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}