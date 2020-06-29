# Dockerfile for Developing H5P Content

This image configures Drupal according to the [recommended settings](https://h5p.org/development-environment) to use it for H5P content development.

## Usage `docker run`

`docker run --name h5p-drupal --mount type=bind,source=/path/to/folder/development,target=/var/www/html/sites/default/files/h5p/development -p 8080:80 chhch/drupal-h5p-development`

Open <http://localhost:8080> in your browser and login with username `admin` and password `admin`.

## Usage `docker-compose`

```yaml
version: "3.8"

services:
  h5p-drupal:
    image: chhch/drupal-h5p-development
    ports: 
      - "8080:80"
    volumes: 
      - "./development:/var/www/html/sites/default/files/h5p/development"
```

Start the container with `docker-compose up`.

Open <http://localhost:8080> in your browser and login with username `admin` and password `admin`.

## Dockerfile Configuration

1. Drupal 7 with H5P module are used :heavy_check_mark:
2. _H5P development mode_ and _H5P development directory_ are activated :heavy_check_mark:
3. `sites/default/files/h5p/development/` folder for development :heavy_check_mark:

For reference see [Set up H5P for Drupal 7](https://h5p.org/documentation/setup/drupal7)
