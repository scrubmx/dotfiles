cd /home/forge/app.com

# Put the application into maintenance mode
php artisan down

# Get the latests changes
git pull origin master

# Install composer dependecies
composer install --no-interaction --no-dev

# Run database migrations
php artisan migrate --force

# Cache the application routes
php artisan route:clear
php artisan route:cache

# Cache the configuration files
php artisan config:clear
php artisan config:cache

# Flush expired password reset tokens
php artisan auth:clear-resets

# Optimize the framework for better performance
php artisan optimize --force

# Submit a deployment notification to bugsnag
# php artisan bugsnag:deploy                        \
#  --repository "https://github.com/scrubmx/app"    \
#  --branch "master"                                \
#  --revision "$(git rev-parse HEAD)"

# Restart the queue worker
sudo supervisorctl restart app

# Bring the application out of maintenance mode
php artisan up
