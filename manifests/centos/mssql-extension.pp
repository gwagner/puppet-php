class php::centos::mssql-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-mssql':
            name => "${php::centos::config::php_prefix}-mssql-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}