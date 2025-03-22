with respdata as (
    select * from {{ source('staging', 'resp_data') }}
)

select
    unique_row_id,
    filename as respFilename,
    weekending,
    healthboardoftreatment,
    IFNULL(influenzaadmissions, 0) as influenzaadmissions,
    IFNULL(rsvadmissions, 0) as rsvadmissions
from respdata
where healthboardoftreatment != 'S92000003'

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}