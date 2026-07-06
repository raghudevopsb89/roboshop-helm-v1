install:
	@kubectl create ns roboshop || true
	@helm upgrade --install $(component_name) ./ -f values/$(component_name).yml -n roboshop

upgrade:
	@az aks get-credentials --resource-group denmark-east-rg --name roboshop-$(cluster_env) --overwrite-existing
	@helm upgrade --install $(component_name) ./ -f values/$(component_name).yml -n roboshop --set github_sha=$(github_sha) --create-namespace


all:
	@kubectl create ns roboshop || true
	@for component_name in cart catalogue frontend orders payment ratings shipping user; do  helm upgrade --install $$component_name ./ -f values/$$component_name.yml -n roboshop; done

