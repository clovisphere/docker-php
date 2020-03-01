<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use DI\ContainerBuilder;

// user defined classes
use Booky\Models\Author;

require __DIR__ . '/../vendor/autoload.php';

// load env variable
$base_dir = __DIR__ . '/../';
$env = $base_dir . '.env';

if (file_exists($env)) {
    $dotenv = new Dotenv\Dotenv($base_dir);
    $dotenv->load();
}

// Instantiate PHP-DI ContainerBuilder
$containerBuilder = new ContainerBuilder();

if (false) { // Should be set to true in production
	$containerBuilder->enableCompilation(__DIR__ . '/../var/cache');
}

// Set up settings
$settings = require __DIR__ . '/../settings.php';
$settings($containerBuilder);

// Build PHP-DI Container instance
$container = $containerBuilder->build();

// instantiate app
AppFactory::setContainer($container);
$app = AppFactory::create();


/**
 *  -- Routes //TODO: move this to a different folder
 */

$app->get('/authors', function (Request $request, Response $response, $args) {
    // retrieve authors from database
    $_author = new Author();
    $authors = $_author->all();
    
    $payload = []; //result data

    foreach($authors as $author) {
        $payload[$author->id] = [
            'first_name' => $author->first_name,
            'last_name' => $author->last_name 
        ];
    }
    
    $response->getBody()->write(json_encode($payload, JSON_PRETTY_PRINT));
    return $response->withHeader('Content-Type', 'application/json')
                    ->withStatus(200);
});

$app->run();
