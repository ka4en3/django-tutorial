.PHONY: build up down logs migrate createsuperuser shell test


build:
docker-compose build


up:
docker-compose up


down:
docker-compose down


logs:
docker-compose logs -f web


migrate:
docker-compose run --rm web python manage.py migrate


createsuperuser:
docker-compose run --rm web python manage.py createsuperuser


shell:
docker-compose run --rm web python manage.py shell


test:
docker-compose run --rm web python manage.py test