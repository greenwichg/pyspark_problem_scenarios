-- Write query here
with
    joined as (
        select c.cust_id, c.date, c.duration
        from cc_calls c
        join
            cc_customer cu
            on c.cust_id = cu.cust_id
    ),
    agg as (
        select
            date,
            count(
                distinct cust_id
            ) as num_customers,
            sum(cast(duration as int)) as total_duration
        from joined
        group by date
    )

select date, num_customers::int, total_duration::int
from agg
order by date
