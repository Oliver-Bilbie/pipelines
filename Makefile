init-bootstrap:
	@echo "[INFO] Initialiasing terraform"
	@cd bootstrap && terraform init
	@echo "[INFO] Validating terraform code"
	@cd bootstrap && terraform validate

plan-bootstrap:
	@echo "[INFO] Running a terraform plan"
	@cd bootstrap && terraform plan -var-file="../terraform.tfvars" -parallelism=30 -refresh=true -out=plan.out

apply-bootstrap:
	@echo "[INFO] Deploying the infrastructure"
	@cd bootstrap && terraform apply -var-file="../terraform.tfvars" -auto-approve

destroy-bootstrap:
	@echo "[INFO] Destroying the infrastructure"
	@cd bootstrap && terraform destroy -var-file="../terraform.tfvars" -auto-approve

init-pipelines:
	@echo "[INFO] Initialiasing terraform"
	@cd pipelines && terraform init -reconfigure -backend-config="backend.conf"
	@echo "[INFO] Validating terraform code"
	@cd pipelines && terraform validate

plan-pipelines:
	@echo "[INFO] Running a terraform plan"
	@cd pipelines && terraform plan -var-file="../terraform.tfvars" -parallelism=30 -refresh=true -out=plan.out

apply-pipelines:
	@echo "[INFO] Deploying the infrastructure"
	@cd pipelines && terraform apply -var-file="../terraform.tfvars" -auto-approve

destroy-pipelines:
	@echo "[INFO] Destroying the infrastructure"
	@cd pipelines && terraform destroy -var-file="../terraform.tfvars" -auto-approve
