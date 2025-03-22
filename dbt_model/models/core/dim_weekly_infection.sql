{{
    config(materialized='table')
}}

with infection_data as (
    select * from {{ ref("fact_data_table")}}
)

select 
weekending,
sum(covidAdmissions) as total_covid,
sum(influenzaadmissions) as total_influenza,
sum(rsvadmissions) as total_rsv,
(sum(covidAdmissions)+sum(influenzaadmissions)+sum(rsvadmissions)) as total_infections from infection_data
group by 1
order by weekending