{{
    config(materialized='table')
}}

with infection_data as (
    select * from {{ ref("fact_data_table")}} where  hbname = "Total"
)

select *, (covidAdmissions+influenzaadmissions+rsvadmissions) as totalInfections from infection_data
order by weekending