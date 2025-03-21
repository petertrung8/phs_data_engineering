{{ config(materialized='table') }}

select HB, HBName, Country from {{ ref('healthboard') }}
union all
select SHB, SHBName, Country from {{ ref('special_hb') }}