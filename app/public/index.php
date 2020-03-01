<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Booky\Models\Author;

require __DIR__ . '/../src/init.php';

/**
 *  Routes // TODO: move this to a different folder
 */

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->get('/authors', function (Request $request, Response $response, $args) {
    $_author = new Author();
    $authors = $_author->all();

    $payload = []; // result data

    foreach($authors as $author) {
        $payload[$author->id] = ['first_name' => $author->first_name, 'last_name' => $author->last_name];
    }

    $response->getBody()->write(json_encode($payload, JSON_PRETTY_PRINT)); // prettify result:-)
    return $response->withHeader('Content-Type', 'application/json')
                    ->withStatus(200);
});

$app->run();
