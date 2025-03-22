with coviddata as (
    select * from {{ source('staging', 'covid_data') }}
)

select
    unique_row_id,
    filename as covidFilename,
    weekending,
    healthboardoftreatment,
    IFNULL(admissions, 0 ) as covidAdmissions
from coviddata
where healthboardoftreatment != 'S92000003'

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}