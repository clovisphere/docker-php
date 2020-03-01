<?php
declare(strict_types=1);

use DI\ContainerBuilder;

// load env variable
$base_dir = __DIR__ . '/../';
$env = $base_dir . '.env';

if (file_exists($env)) {
    $dotenv = Dotenv\Dotenv::createImmutable($base_dir);
    $dotenv->load();
}

// Instantiate PHP-DI ContainerBuilder
$containerBuilder = new ContainerBuilder();

if (false) { // Should be set to true in production
	$containerBuilder->enableCompilation(__DIR__ . '/../var/cache');
}

// Set up settings
$settings = require __DIR__ . '/settings.php';
$settings($containerBuilder);
// Set up dependencies
$dependencies = require __DIR__ . '/dependencies.php';
$dependencies($containerBuilder);
// Build PHP-DI Container instance
$container = $containerBuilder->build();
