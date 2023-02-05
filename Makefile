init:
	@echo "[INFO] Initialiasing terraform"
	@cd terraform && terraform init
	@echo "[INFO] Validating terraform code"
	@cd terraform && terraform validate

plan:
	@echo "[INFO] Running a terraform plan"
	@cd terraform && terraform plan -parallelism=30 -refresh=true -out=plan.out

apply:
	@echo "[INFO] Deploying the infrastructure"
	@cd terraform && terraform apply -auto-approve

destroy:
	@echo "[INFO] Destroying the infrastructure"
	@cd terraform && terraform destroy -auto-approve