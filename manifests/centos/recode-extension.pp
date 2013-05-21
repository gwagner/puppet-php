class php::centos::recode-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-recode':
            name => "${php::centos::config::php_prefix}-recode-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}