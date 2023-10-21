use Академики;

select
Doctor, Case_Number,
case Field when 'Injection' then 'X' else '' end as Injection,
case Field when 'Surgery' then 'X' else '' end as Surgery,
case Field when 'H-Test' then 'X' else '' end as [H-Test],
case Field when 'Discharge' then 'X' else '' end as Discharge
from Cases
group by (Case_Number);