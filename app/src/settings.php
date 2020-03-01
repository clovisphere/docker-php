<?php
declare(strict_types=1);

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection(
    [
        "driver"    => getenv('DB_DRIVER'),
        "host"      => getenv('DB_HOSTNAME'),
        "database"  => getenv('DB_NAME'),
        "username"  => getenv('DB_USERNAME'),
        "password"  => getenv('DB_PASSWORD'),
        "charset"   => "utf8",
        "collation" => "utf8_general_ci",
        "prefix"    => ""
]);

$capsule->bootEloquent();
