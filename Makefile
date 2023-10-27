
build:
	DOCKER_BUILDKIT=1 docker build --pull --rm -f "Dockerfile" --target tmp -t trash "."
	DOCKER_BUILDKIT=1 docker build --target repo -t repo "."
	DOCKER_BUILDKIT=1 docker build --target local -t local "."

up:
	docker compose up -d 

down:
	docker compose down





