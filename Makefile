.PHONY: build up log down clean push save load create destroy

build:
	docker-compose build --no-cache

up: build
	docker-compose up -d

log: up
	docker-compose logs

down:
	docker-compose down

clean:
	docker rmi $(DOCKER_REGISTRY)/$(GROUP_NAME)/$(PROJECT_NAME)

push: build
	docker push $(DOCKER_REGISTRY)/$(GROUP_NAME)/$(PROJECT_NAME)

save:
	docker image save $(DOCKER_REGISTRY)/$(GROUP_NAME)/$(PROJECT_NAME) --output welcome-page.tar

load:
	docker image load --input welcome-page.tar

create: push
	oc apply -f .openshift/welcome-page.yaml

destroy: clean
	oc delete -f .openshift/welcome-page.yaml
