FROM drupal:7

ENV DRUSH_LAUNCHER_VERSION 0.6.0
ENV COMPOSER_VERSION 1.8.5
ENV ADMIN_NAME admin
ENV ADMIN_PASSWORD admin

RUN apt-get update && apt-get install -y \
    sqlite3 \
    nano

WORKDIR /var/www/html

# To work with drush-launcher on non-composer drupal 7 projects
#  we have to create a composer.json file and install composer
#  https://github.com/drush-ops/drush-launcher/issues/33

COPY composer.json .

RUN curl -o composer https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    chmod +x composer && \
    ./composer install

RUN cp sites/default/default.settings.php sites/default/settings.php && \
    chown www-data sites/default/settings.php

# Install drush-launcher

RUN curl -fsSL -o /usr/local/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/${DRUSH_LAUNCHER_VERSION}/drush.phar && \
    chmod +x /usr/local/bin/drush

# To enable h5p and h5p editor without errors, we have to set 
#  post_max_size = 20M
#  upload_max_filesize = 20M

COPY php.ini-development ${PHP_INI_DIR}/php.ini

# Setup drupal

RUN drush site:install --db-url=sqlite://sites/default/files/.ht.sqlite --account-name=${ADMIN_NAME} --account-pass=${ADMIN_PASSWORD} --yes && \
    drush pm-download h5p --yes && \
    drush pm-enable h5p h5peditor --yes && \
    drush variable-set --exact h5p_dev_mode 1 && \
    drush variable-set --exact h5p_library_development 1 && \
    chmod -R a+w sites modules themes
