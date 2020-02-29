# docker-php

A very basic development environment setup :computer: for [PHP](https://www.php.net/):elephant: using [Docker](https://www.docker.com/) :anchor: :ship:.

#### Prerequisite

Please install [docker](https://hub.docker.com/search?q=&type=edition&offering=community&sort=updated_at&order=desc) and [docker-compose](https://docs.docker.com/compose/install/) :wink:

#### Usage

1. Clone the app

```bash
$ git clone https://github.com/clovisphere/docker-php.git
```

The content should look like :point_down:

```console
.
├── Dockerfile
├── README.md
├── app
│   └── index.php
└── docker-compose.yml
```

There's a `.devops/` folder that contains `nginx` configs.

2. To bring to live your setup :stars: :sunrise: :rocket:

```bash
$ docker-compose up --build
```

If everything went well, your app will be available on [http://localhost:8080](http://localhost:8080).

To check your containers status(es) :bar_chart:, run:

```bash
$ docker ps -a
```

To stop and remove all containers:

```bash
$ docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
```

:warning: _this will stop and remove all your containers, use with caution_ :boom:

To remove all images:

```bash
$ docker rmi -f $(docker images -q)
```

:warning: _this will delete all your images, use with caution_ :boom:

In case of any doubt, please:

```bash
$ docker --help
```

and 

```bash
$ docker-compose --help
```

Enjoy :v::sunglasses:
