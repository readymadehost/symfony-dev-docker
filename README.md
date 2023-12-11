# Symfony dev docker

A development docker for every symfony project


## Features

- Build for symfony projects
- Bundle of `fpm`, `cli`, `nginx`, `mariadb`, `phpmyadmin`, `mongodb`, `redis` and `emailcatcher` containers
- PHP 8.3, 8.2, 8.1, 8.0, 7.4, 7.3, 7.2, 7.1, 7.0 and 5.6 supported
- Database mariadb 10.x, mongodb 6.x ... supported
- Node 20.x, 18.x, 17.x, 16.x, ... supported
- Included symfony, composer, node cli and yarn cli
- Included emailcatcher with smtp and web view
- Support for PhpStorm or VSCode + WSL2/docker-desktop setup
- Support for xdebug included check `.env` file


## Docker setup

- `git clone https://github.com/readymadehost/symfony-dev-docker.git project-docker`
- `cd project-docker`
- `mkdir project` or `git clone <some_git_repo_url> project` for existing project
- `cp .env.sample .env` and review `.env` file
- `docker-compose build` only required if you edit `docker-compose.yml` to enable build
- `docker-compose up -d`
- `docker-compose exec cli bash`
- `symfony check:requirements`


## New symfony project install

- `docker-compose exec cli bash` and make sure you are at `/var/www/project` dir
- `composer create-project symfony/website-skeleton .`
or `composer create-project symfony/skeleton .`

or `cd ../ && symfony new project --full`

or `cd ../ && symfony new project`

or `cd ../ && symfony new project --version=lts`

or `cd ../ && symfony new project --demo`

or `cd ../ && symfony new project --version=next`

- Run bash alis `mpp` for `/root/manage-project-permission.sh`


## Notes

- Project URL: http://{localhost/any_valid_host}:8080/
- PhpMyAdmin URL: http://{localhost/any_valid_host}:8180/
- Mailcatcher URL: http://{localhost/any_valid_host}:8280/
- For more info and change, check `.env` and `docker-compose.yml`
- Manage permission inside container using bash alias `mpp` or `/root/manage-project-permission.sh`
- Mariadb default:- host: `mariadb` user: `root`, password: `root`, database: `project`
- Mongodb default:- host: `mongodb` user: `root`, password: `root`, database: `project`, authSource: `admin`

```text
- <docker_root_dir> <-- docker root dir
- <docker_root_dir>/data <-- all docker data persist
- <docker_root_dir>/nginx <-- nginx
- <docker_root_dir>/php* <-- php cli and fpm containers
- <docker_root_dir>/.env <-- docker environment configuration

- <docker_root_dir>/project <-- project root dir

- <docker_root_dir>/project* <-- added in .gitignore
- <docker_root_dir>/*.sql <-- added in .gitignore
```


## Mailcatcher support

Mailcatcher service is included, can be accessed using URL and can be configured using smtp:-

```
smtp://mailcatcher:1025
```


## Mongodb support

Mongodb service is disabled by default. Check `.env` and `docker-compose.yml` for more info. Mongodb can be connected using compass:-

```
mongodb://root:root@localhost:27017/?authSource=admin
```


## Sample project

A symfony5 sample project using symfony dev docker + github actions for continuous integration.

- https://github.com/readymadehost/symfony-dev-docker-sample


## Phpstorm setup

Simply add remote docker-compose php cli interpreter (exec with docker-compose.yml), change path mapping and configure remote interpreter for composer, phpunit, phpcs, phpcbf, phpmd and php-cs-fixer.


## Remote container extension + vscode

With vscode's remote container extension, we can simply connect into cli container.

## Pre build docker image

- `readymadehost/symfony-dev-docker-php{PHP_VERSION}-cli:latest`
- `readymadehost/symfony-dev-docker-php{PHP_VERSION}-fpm:latest`


## Quick Link

* Easy installation of PHP extensions in official PHP Docker images
    - https://github.com/mlocati/docker-php-extension-installer

* MailCatcher
    - https://github.com/sj26/mailcatcher

* ReadyMadeHost docker hub
    - https://hub.docker.com/orgs/readymadehost
