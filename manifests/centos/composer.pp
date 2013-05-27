class php::centos::composer($path)
{
    include php, git

    file {
        'composer_home':
            path   => '/root/.composer',
            ensure => 'directory',
            mode   => 0644,
            owner  => 'root',
            group  => 'root';
    }

    exec {
        # First make sure we have composer
        "php-composer-install":
            command => "curl -sS https://getcomposer.org/installer | php",
            cwd => $path,
            creates => "${path}/composer.phar",
            require => [
                Package['git', "php-ext-xml", "php-common", "php-cli"],
            ];

        # Then do an init
        "php-composer-init":
            command => "php composer.phar install -v",
            cwd => $path,
            creates => "${path}/composer.lock",
            environment => "COMPOSER_HOME=/root/.composer",
            require => [
                File['composer_home'],
                Exec['php-composer-install'],
                Package['git', "php-ext-xml", "php-common", "php-cli"],
            ];

        # Any other time the machine starts, do an update
        "php-composer-update":
            command => "php composer.phar update -v",
            cwd => $path,
            environment => "COMPOSER_HOME=/root/.composer",
            require => [
                File['composer_home'],
                Exec['php-composer-install'],
                Exec['php-composer-init'],
                Package['git', "php-ext-xml", "php-common", "php-cli"],
            ];

    }
}