clean:
	@rm -rf aws/{dev,prod,uat}/{app,database,vpc}/{.terraform*,.terragrunt*}

dev uat prod:
	cd aws/$@ && terragrunt run-all apply -auto-approve

destroy:
	cd aws/$(dir) && terragrunt run-all destroy -auto-approve

plan:
	cd aws/$(dir) && terragrunt run-all plan -skip_outputs true