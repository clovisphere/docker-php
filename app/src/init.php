<?php
declare(strict_types=1);

require __DIR__ . '/../vendor/autoload.php';

// load env variable
$base_dir = __DIR__ . '/../';
$env = $base_dir . '.env';

if (file_exists($env)) {
    $dotenv = Dotenv\Dotenv::createImmutable($base_dir);
    $dotenv->load();
}
// App configuration
include __DIR__ . '/settings.php';
// initialize app
$app = new \Slim\App();
