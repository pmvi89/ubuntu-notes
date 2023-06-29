#https://fraigo.github.io/laravel-install-script/
#bash <(curl -s https://fraigo.github.io/laravel-install-script/laravel-install.sh)

#!/bin/bash

# Laravel installation script
# https://github.com/fraigo/laravel-install-script/

message () {
  echo -e "\033[0;32m$1\033[0m"
}

message "Install PHP"
sudo apt-get update
sudo apt-get install php

message "Install php dependencies"
sudo apt-get install php-zip
sudo apt-get install php-mbstring

message "Install composer"
sudo apt-get install composer

message "Install laravel"
composer global require "laravel/installer"
PATH=$PATH:$HOME/.config/composer/vendor/bin
echo 'PATH=$PATH:$HOME/.config/composer/vendor/bin' >> $HOME/.bashrc

#move to www folder
#cd /var/www/

message "Create a new Laravel project"
laravel new /var/www/laravel-app
cd /var/www/laravel-app

message "Update dependencies"
composer install

message "Create environment"
### Create initial .env file using the template file .env.example
### Creating a security key for the application
cp .env.example .env
php artisan key:generate


## message "Modify config file"
## In laravel-app/config/app.php, change APP_DEBUG to true
##  'debug' => env('APP_DEBUG', true),


message "Starting local application service"
echo "Point your browser to http://localhost:8000/"
#php artisan serve
 php artisan serve --host=0.0.0.0  --port=8000

 #create the login view
composer require laravel/ui
php artisan ui bootstrap
php artisan ui bootstrap --auth
npm install

###########

apt install npm
npm install && npm run dev
 php artisan migrate

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Close and reopen your terminal or run the command:
source ~/.bashrc

# Install a compatible Node.js version (e.g., 14.x)
nvm install 14

# Switch to the installed Node.js version
nvm use 14

