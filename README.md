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

2. To bring to life your setup :stars: :sunrise: :rocket:

```bash
$ docker-compose up --build
```

If everything went well, your app will be available on [http://localhost:8080](http://localhost:8080).

To check your container(s) status(es) :bar_chart:, run:

```bash
$ docker ps -a
```

Enjoy :v::sunglasses:
