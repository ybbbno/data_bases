use ������;

/*������� 1*/
select ������ from ������ where ������� < 500000
union all select ������ from ������ where ������� > 5000000;

/*������� 2*/
select cast(������ as nvarchar(20)) as ������ from ������ where ������� > 1000000
except select cast(������ as nvarchar(20)) as ������ from ������ where ��������� < 100000000;

/*������� 3*/
select cast(������ as nvarchar(20)) as ������ from ������ where ������� < 500000
intersect select cast(������ as nvarchar(20)) as ������ from ������ where ��������� < 100000;