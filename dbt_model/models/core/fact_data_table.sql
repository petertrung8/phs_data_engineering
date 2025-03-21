{{
    config(
        materialized='table'
    )
}}

with covid as (select unique_row_id as covid_id, covidAdmissions, covidFilename  from {{ ref("stg_covid_data") }}),
     resp as (select * from {{ ref("stg_resp_data") }})

select *
from covid
inner join
    resp
    on covid.covid_id = resp.unique_row_id
