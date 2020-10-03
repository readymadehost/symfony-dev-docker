# Symfony dev docker

A development docker for every symfony project


## Features

- Build for symfony and has cli tools
- Bundle of `fpm`, `cli`, `nginx`, `redis`, `mariadb` and `phpmyadmin` containers
- Latest php7.4 and multiple version coming soon..
- Included symfony, composer and node cli
- Support for PhpStorm or VSCode + WSL2/docker-desktop setup
- Prebuild docker images coming soon..


## Docker setup

- `git clone https://github.com/readymadehost/symfony-dev-docker.git project-docker`
- `cd project-docker`
- `mkdir project` or `git clone <some_git_repo_url> project` for existing project
- `docker-compose up -d`
- `docker-compose exec cli bash`
- `symfony check:requirements`


## New symfony project install

- `docker-compose exec cli bash` and make sure you are at `/var/www/project` dir
- `composer create-project symfony/website-skeleton .`
- or `composer create-project symfony/skeleton`
- Run bash alis `mpp` for `/root/manage-project-permission.sh`


## Notes

- Project URL: http://{localhost/any_valid_host}:8080/
- PhpMyAdmin URL: http://{localhost/any_valid_host}:8180/
- For more info and change, check `docker-compose.yml`
- Manage permission inside container using bash alias `mpp` or `/root/manage-project-permission.sh`
- Mariadb default:- host: `mariadb` user: `root`, password: `root`

```text
- <docker_root_dir> <-- docker root dir
- <docker_root_dir>/data <-- all docker data persist
- <docker_root_dir>/nginx <-- nginx
- <docker_root_dir>/php* <-- php cli and fpm containers
- <docker_root_dir>/project <-- project root dir
- <docker_root_dir>/project* <-- added in .gitignore
- <docker_root_dir>/*.sql <-- added in .gitignore
```


## Phpstorm

Simply add remote docker php cli interpreter, change path mapping and configure remote interpreter everywhere.


## Container + vscode

With vscode's remote container extension, we can simply connect into cli container.


## For production usages

- Planning for ready made host. Coming soon...