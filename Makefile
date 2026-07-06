install:
	@kubectl create ns roboshop || true
	@helm upgrade --install $(component_name) ./ -f values/$(component_name).yml -n roboshop

upgrade:
	@helm upgrade --install $(component_name) ./ -f values/$(component_name).yml -n roboshop --set github_sha=$(github_sha)


all:
	@kubectl create ns roboshop || true
	@for component_name in cart catalogue frontend orders payment ratings shipping user; do  helm upgrade --install $$component_name ./ -f values/$$component_name.yml -n roboshop; done

