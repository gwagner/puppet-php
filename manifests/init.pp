class php
{
    case $operatingsystem {
        'RedHat', 'CentOS': { include php::centos::base }
        'Ubuntu':           { include php::ubuntu::base }
    }
}