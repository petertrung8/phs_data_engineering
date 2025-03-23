#### Kestra setup

## Launch Kestra

Navigate to the `kestra` folder. Use the following command to start the Kestra server:
```
docker-compose up -d
```
In VSCode forward the port `8080`. Open the URL http://localhost:8080 in your browser to launch the UI.

## GCP connection setup

To connect with GCP, follow this procedure:
1. Copy the flow from `gcp_kv.yml` into Kestra. 
2. Edit `gcp_project_id` and `gcp_bucket_name` to match your project and bucket name, respectively. Other edits are optional. Save the flow.
3. Go to `Namespaces` and click on `phs-dataset`. Go to `KV Store` and click on the `phs-dataset`.
4. Click on `New Key-Value` and paste the content of your service account `*.json` into the `Value` field.
5. Name the key-value `GCP_CREDS` and save it.
6. Execute the `gcp_kv.yml`.

If you check `KV Store` in the `phs-dataset`, `GCP_DATASET`, `GCP_BUCKET_NAME`, `GCP_PROJECT_ID` and `GCP_LOCATION` should have been created.

## Running the flow

Copy the flow from the `phs-dataset-pipeline.yml` into Kestra. The flow should have triggers enabled that run every Monday at 1am.

To do backfill, go into `Triggers` and then execute the backfill for a given date range.

