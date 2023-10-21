use Академики;
select * from Академики order by ФИО asc offset 8 rows fetch next 2 rows only;