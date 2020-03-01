<?php
declare(strict_types=1);

use Psr\Container\ContainerInterface;

$container = $app->getContainer();

$container['db'] = function (ContainerInterface $container) {
    $capsule = new \Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($container->get('settings')['db']);
    $capsule->setAsGlobal();
    $capsule->bootEloquent();
};

