<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Booky\Models\Author;

require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../src/init.php';
// instantiate app
AppFactory::setContainer($container);
$app = AppFactory::create();

/**
 *  Routes // TODO: move this to a different folder
 */

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->run();
