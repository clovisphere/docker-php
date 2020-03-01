<?php

<?php
declare(strict_types=1);

use DI\ContainerBuilder;
use Monolog\Logger;

return function (ContainerBuilder $containerBuilder) {
    // Global Settings Object
    $containerBuilder->addDefinitions([
        'settings' => [
            'displayErrorDetails' => true, // Should be set to false in production
            'db' => [
                'driver'    => 'mysql',
                'host'      => '',
                'database'  => '',
                'username'  => '',
                'password'  => '',
                'charset'   => 'utf8',
                'collation' => 'utf8_unicode_ci',
                'prefix'    => '',
            ]
            'logger' => [
                'name' => 'booky-api',
                'path' => isset($_ENV['docker']) ? 'php://stdout' : __DIR__ . 'logs/app.log',
                'level' => Logger::DEBUG,
            ],
        ],
    ]);
};
