init: docker-down-clean docker-up app-init

start: docker-down-clean docker-up

docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down-clean:
	docker-compose down -v --remove-orphans

app-init: composer-install artisan-key-generate artisan-migrate-seed artisan-storage-link

composer-install:
	docker-compose exec app composer install
artisan-key-generate:
	docker-compose exec app php artisan key:generate
artisan-migrate-seed:
	docker-compose exec app php artisan migrate --seed
artisan-storage-link:
	docker-compose exec app php artisan storage:link
bash:
	docker-compose exec app bash
