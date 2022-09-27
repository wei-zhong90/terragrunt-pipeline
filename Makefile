clean:
	@rm -rf aws/{dev,prod,uat}/{app,database,vpc}/{.terraform*,.terragrunt*}

dev uat prod:
	cd aws/$@ && terragrunt run-all apply

destroy:
	cd aws/$(dir) && terragrunt run-all destroy