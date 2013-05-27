class php::ubuntu::config {

    $php_timezone = 'America/Chicago'

    $extension_dependencies = [
        File['/etc/php.ini'],
        Package["php-common"],
        Package["php-cli"],
        Package["php-devel"]
    ]
}