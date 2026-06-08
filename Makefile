install:
	@kubectl create ns roboshop
	@helm upgrade --install $(component_name) ./ -f values/$(component_name).yml -n roboshop

all:
	@kubectl create ns roboshop
	@for component_name in cart catalogue frontend orders payment ratings shipping user; do  helm upgrade --install $$component_name ./ -f values/$$component_name.yml -n roboshop; done

