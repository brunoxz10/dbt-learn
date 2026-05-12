with payments as (
    select * from {{ ref('stg_stripe__payments') }}
    where status = 'success'
),

pivoted as (
    select
        order_id,
        
        {% for payment in ['bank_transfer','coupon','credit_card','gift_card'] %}
            sum(case when paymentmethod = '{{ payment }}' then amount else 0 end) as {{ payment }}_amount
            {%- if not loop.last -%}
                ,
            {%- endif -%}
        {% endfor %}

    from payments
    group by 1
)

select * from pivoted
