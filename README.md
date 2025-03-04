# Laravel with Docker environment

## Running the project with Docker Compose

### After cloning the repository from gitHub:

Copy example files:

```bash
cp docker-compose.example.yml docker-compose.yml
cp .env.example .env
```

and change some parameters in these files **if needed**
(for example, `FORWARD_DB_PORT`, `WEB_SERVER_PORT`, `DB_PASSWORD`, `DB_HOST` etc. in the `.env` file).

Then run:

```bash
docker compose up -d
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan storage:link
docker compose exec app php artisan migrate
```

### Run tests

```bash
docker compose exec app ./vendor/bin/phpunit tests
```
