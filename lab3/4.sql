use ������;

/*6 �������� �� like*/
select ������ from ������
where ������ like '%��';

select ������ from ������
where ��������� like '%�';

select ������ from ������
where ������ like '[�,�]%�';

select ������ from ������
where ��������� like '�%[�,�]';

select ������ from ������
where ������ like '%\-%' escape '\';

select ������ from ������
where ������� like '%\-%' escape '\';

/*union, union all, except, intersect*/
select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '�%'
union select cast(������ as nvarchar(20)) as ������ from ������ where ��������� like '%�';

select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '�%'
union all select cast(������ as nvarchar(20)) as ������ from ������ where ��������� like '%�';

select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '�%'
except select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '%�';

select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '�%'
intersect select cast(������ as nvarchar(20)) as ������ from ������ where ������ like '%�';

/*where, having, from*/
select ������ from (select ������ from ������ where cast(��������� as nvarchar(20)) = '����') A where ������ like '�%';

select ��������� from ������ group by ��������� having ��������� > 5000000;

/*insert, update, delete*/
insert into ������2
select * from ������ where ������ like '�%';

update ������2
set ������2.������ = ������.������
from ������ where ��������� > 500000;

delete from ������2
where ������ in (select ������ from ������ where ������ like '���������');

