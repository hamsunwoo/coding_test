select date_format(a.sales_date, '%Y-%m-%d') as SALES_DATE,
        a.PRODUCT_ID as PRODUCT_ID,
        a.USER_ID as USER_ID,
        a.SALES_AMOUNT as SALES_AMOUNT
from (select  o.sales_date,
        o.product_id as PRODUCT_ID,
        o.USER_ID as USER_ID,
        o.SALES_AMOUNT as SALES_AMOUNT
from online_sale o
union all
select  f.sales_date,
        f.product_id,
        NULL,
        f.SALES_AMOUNT
from offline_sale f) as a
where SALES_DATE between '2022-03-01' and '2022-03-31'
order by SALES_DATE asc,
        PRODUCT_ID asc,
        USER_ID asc;
