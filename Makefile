.PHONY: lint tag push build upgrade
docker_image = pwinnington/flask_app
tag = latest

lint:
	@helm lint $(PWD)/flaskapp

build:
	@docker build $(PWD)/web/.

tag:
	@docker tag $(docker_image)  $(docker_image):$(tag)  

push:
	@docker push $(docker_image)

upgrade: lint
	@helm upgrade flask $(PWD)/flaskapp
