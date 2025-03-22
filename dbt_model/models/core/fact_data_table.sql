{{
    config(
        materialized='table'
    )
}}

with covid as (select unique_row_id as covid_id, covidAdmissions, covidFilename  from {{ ref("stg_covid_data") }}),
     resp as (select * from {{ ref("stg_resp_data") }}),
     viral_t as (select * from covid
                 inner join resp
                 on covid.covid_id = resp.unique_row_id),
     hb_code as (select HB, HBName from {{ ref("dim_hb")}}),
     union_t as (select
                    viral_t.unique_row_id as row_id,
                    viral_t.weekending,
                    viral_t.healthboardoftreatment,
                    IFNULL(viral_t.covidAdmissions, 0) as covidAdmissions,
                    IFNULL(viral_t.influenzaadmissions, 0) as influenzaadmissions,
                    IFNULL(viral_t.rsvadmissions, 0) as rsvadmissions
                 from viral_t),
     stg_fact as (select * from union_t
                  left join hb_code
                  on union_t.healthboardoftreatment = hb_code.hb
                  order by weekending)
select stg_fact.weekending,
    stg_fact.healthboardoftreatment,
    IFNULL(stg_fact.HBName, "Total") as HBName,
    stg_fact.covidAdmissions,
    stg_fact.influenzaadmissions,
    stg_fact.rsvadmissions
from stg_fact