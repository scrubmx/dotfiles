# Exit when any command fails
set -e

# Cleanup deploy directories if any exist
rm -rf /home/forge/deploy

# Copy current version for deploy
cp -rp /home/forge/globaltoons.tv /home/forge/deploy

cd /home/forge/deploy

# Get the latests changes
git pull origin master

# Install npm dependecies then compile assets
npm install
npm run production

# Install composer dependecies
composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader

cd /home/forge/globaltoons.tv

# Put the application into maintenance mode
php artisan down

# Remove compiled service and package files
php artisan clear-compiled

# Synchronize files from deploy to globaltoons.tv directory
rsync --archive                   \
      --whole-file                \
      --delete-after              \
      --human-readable            \
      --exclude="node_modules"    \
      --exclude="storage"         \
      --exclude=".env"            \
      /home/forge/deploy/         \
      /home/forge/globaltoons.tv/

# Cache the application routes
php artisan route:clear
php artisan route:cache

# Cache the configuration files
php artisan config:clear
php artisan config:cache

# Run database migrations
php artisan migrate --force

# Flush expired password reset tokens
php artisan auth:clear-resets

# Reload the php-fpm service
sudo service php7.2-fpm reload

# Restart the application queue worker
php artisan queue:restart

# Bring the application out of maintenance mode
php artisan up

# Notify bugsnag about the deploy
php artisan bugsnag:deploy \
  --branch "master" \
  --revision "$(git rev-parse HEAD)" \
  --repository "https://github.com/datacreativa/globaltoons"
