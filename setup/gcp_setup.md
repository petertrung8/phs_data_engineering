## Setting up Google Cloud Platform (GCP)

In this project, we set up key infrastructure elements using the Google Cloud Platform (GCP), including Google Bucket for storage and BigQuery for data warehousing. We used the Terraform Infrastructure as Code (IaC) tool to assist with this part of the project.

In this guide, the setup of GCP will be detailed.

#### Initial steps

1. Setup your GCP account (**Note:** You can get 300 USD free credit if you are a new user).

2. Create a new project, remember the project ID (it might be different from project name).

3. Ensure that Compute Engine, BigQuery API, Cloud Storage API, IAM API, IAM Service Credentials API are all enabled.

#### Creating Service Account

4. Go to `IAM & Admin` -> `Service accounts`.

5. Click on `Create service account`, enter name and description (optional).

6. Select the roles to be granted to the service account, for this project we will need `BigQuery Admin`, `Storage Admin` and `Compute Admin` Roles. Create the account

7. Click on the created service account to view it's details. Go to `Keys` tab and click on `Add Key`.

8. Download `.json` key and keep it in an appropriate path.


**WARNING** The key contains sensitive information to your account. Do not share it to anyone else or push it into your GitHub repo.