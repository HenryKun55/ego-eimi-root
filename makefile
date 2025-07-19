.PHONY: clean build

clean:
	docker stop $$(docker ps -aq) || true
	docker rm -f $$(docker ps -aq) || true
	docker rmi -f $$(docker images -aq) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q | grep -v "bridge\|host\|none") || true
	docker builder prune -af || true

build:
	docker-compose up --build -d
