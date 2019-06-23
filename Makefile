# Digital Ocean API token
DIGITALOCEAN_TOKEN := INSERT_TOKEN_HERE

.PHONY: docker-run
docker-run:
	docker run --rm -ti \
	-e DIGITALOCEAN_TOKEN=$(DIGITALOCEAN_TOKEN) \
	-v $$PWD/terraform:/home/terraform \
	-w /home/terraform \
	hashicorp/terraform \
	$(COMMAND)

.PHONY: init
init:
	COMMAND="init" \
	make docker-run

.PHONY: nextcloud
nextcloud: init
	COMMAND="apply" \
	make docker-run

.PHONY: destroy
destroy: init
	COMMAND="destroy" \
	make docker-run