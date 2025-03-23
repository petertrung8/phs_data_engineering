## Terraform files setup

For setting up properly Terraform, several edits need to be done in the `variables.tf` file.

Required edits:
* `credentials` - path to your Service account `.json`
* `project` - name of the created project
* `gcs_bucket_name` - must be globally unique

Other edits are optional, depending on your location and region.

#### Infrastructure initialization

Once you renamed the above fields, creating the infrastructure in GCP is done like this:

1. Initiate terraform `terraform init`.
2. View the terraform plan `terraform plan` and check the following services to be created.
3. Apply the plan by running `terraform apply` . Enter `yes`.

Note: When you want to destroy the services run `terraform destroy`.