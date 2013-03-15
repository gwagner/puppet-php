class php::mongo-1_3-extension
{
    include php::config

    $installingMongoDriverVersion = $php::config::mongo_1_3_version

    file{
        'install-php-mongo.sh':
            mode => 744,
            owner => "root",
            group => "root",
            path => "/tmp/install-php-mongo.sh",
            content => template('php/install-php-mongo.erb');
        'mongo-package':
            mode => 744,
            owner => "root",
            group => "root",
            path => "/tmp/mongo-php-driver-${php::config::mongo_1_3_version}.tar.gz",
            source => "puppet:///modules/php/mongo-php-driver-${php::config::mongo_1_3_version}.tar.gz";
        'mongo-extension-ini':
            mode => 644,
            owner => "root",
            group => "root",
            path => "/etc/php.d/mongo.ini",
            content => template('php/mongo-1_3-extension-ini.erb');
    }

    exec{
        'php-ext-mongo':
            command => '/tmp/install-php-mongo.sh',
            user => 'root',
            onlyif => "test `php --re mongo | grep version | grep ${php::config::mongo_1_3_version} } | wc -l` -eq 0",
            require => [
                File['install-php-mongo.sh'],
                File['mongo-package'],
                $php::config::extension_dependencies
            ];
    }
}