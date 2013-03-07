class php::composer($path)
{
    include php, php::config, git

    exec {
        # First make sure we have composer
        "php-composer-install":
            command => "curl -sS https://getcomposer.org/installer | php",
            cwd => $path,
            creates => "${path}/composer.phar",
            require => [
                Package['git', "${php::config::php_prefix}-xml-${php::config::php_version}"],
                $php::config::extension_dependencies
            ];

        # Then do an init
        "php-composer-init":
            command => "php composer.phar install -v",
            cwd => $path,
            creates => "${path}/composer.lock",
            require => [
                Exec['php-composer-install'],
                Package['git', "${php::config::php_prefix}-xml-${php::config::php_version}"],
                $php::config::extension_dependencies
            ];

        # Any other time the machine starts, do an update
        "php-composer-update":
            command => "php composer.phar update -v",
            cwd => $path,
            require => [
                Exec['php-composer-install'],
                Exec['php-composer-init'],
                Package['git', "${php::config::php_prefix}-xml-${php::config::php_version}"],
                $php::config::extension_dependencies
            ];

    }
}