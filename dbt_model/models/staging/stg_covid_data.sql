with coviddata as (
    select * from {{ source('staging', 'covid_data') }}
)

select
    unique_row_id,
    filename,
    weekending,
    healthboardoftreatment,
    IFNULL(admissions, 0 ) as covidAdmissions
from coviddata

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 10

{% endif %}