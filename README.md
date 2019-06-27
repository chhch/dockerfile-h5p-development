# Dockerfile for Developing H5P Content

## Recommended Development Setup

> This setup must not be done on a production site. It must be done on a site that is dedicated to developing H5P libraries.
> 1. Use Drupal 7 with the H5P module - we will add development mode and folder to Wordpress and other platforms as well, but currently they're only available for Drupal
> 2. Go to the H5P settings page and enable "H5P development mode" and "H5P development directory"
> 3. In your file folder go to sites/default/files/h5p/development and place the libraries you want to develop in this folder. So for instance if you want to work on interactive video you'll have interactive video's library.json in sites/default/files/h5p/development/h5p-interactive-video/library.json.

From [H5P.org - Development Environment](https://h5p.org/development-environment)

## Dockerfile Configuration

1. Drupal 7 with H5P module are used :heavy_check_mark:
2. _H5P development mode_ and _H5P development directory_ are activated :heavy_check_mark:
3. `sites/default/files/h5p/development/` folder for development :heavy_check_mark:

For reference see [Set up H5P for Drupal 7](https://h5p.org/documentation/setup/drupal7)

## Usage

`docker run --name h5p-drupal --mount type=bind,source=/path/to/folder/development/,target=/var/www/html/sites/default/files/h5p/development/ \-p 8080:80 -volume drupal-h5p-development`