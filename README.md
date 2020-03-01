# docker-php

A very basic development environment setup :computer: for [PHP](https://www.php.net/):elephant: using [Docker](https://www.docker.com/) :anchor: :ship:.

**Note:** The sample app uses [Slim-PHP](http://www.slimframework.com/), but this setup can be used with other PHP frameworks, or vanilla PHP.

#### Prerequisite

+ [docker](https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc)
+ [docker-compose](https://docs.docker.com/compose/install/)

#### Usage

1. Clone the app

```bash
$ git clone https://github.com/clovisphere/docker-php.git
```

The content should look like :point_down:

```console
.
├── Dockerfile
├── Makefile
├── README.md
├── app
└── docker-compose.yml
```

There's a `.devops/` folder that contains `nginx` configs.

2. To bring to life your setup :stars: :rocket:

```bash
$ make
```

If everything went well, your app will be available on [http://localhost:8080](http://localhost:8080)

Enjoy :v::sunglasses:
