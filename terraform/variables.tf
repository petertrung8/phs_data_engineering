variable "credentials" {
  description = "My Credentials"
  default     = "~/.google/credentials/de-account-manager.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "phs-accident-weekly"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default = "asia-northeast1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default = "ASIA-NORTHEAST1"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default = "phs_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  default = "phs-bucket-petertrung8"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

variable "instance_name" {
  description = "VM instance name"
  default     = "vm-01"
}

variable "machine_type" {
  description = "GCP Instance Type"
  default     = "e2-medium"
}

variable "zone" {
  description = "Region for GCP instance."
  default     = "asia-northeast1-a"
}