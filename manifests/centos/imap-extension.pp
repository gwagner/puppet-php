class php::centos::imap-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-imap':
            name => "${php::centos::config::php_prefix}-imap-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;

    }
}