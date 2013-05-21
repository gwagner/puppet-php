class php::centos::process-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-process':
            name => "${php::centos::config::php_prefix}-process-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}