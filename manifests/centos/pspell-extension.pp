class php::centos::pspell-extension
{
    require php::centos::config, repo_ius

    package {
        'php-ext-pspell':
            name => "${php::centos::config::php_prefix}-pspell-${php::centos::config::php_version}",
            ensure => installed,
            provider => 'yum',
            require => $php::centos::config::extension_dependencies;
    }
}