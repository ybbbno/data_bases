use ������;

/*������� 1*/
select top 5 ������, ������� from ������ order by ������� desc;

/*������� 2*/
select ������ from ������
where (��������� like '������') and (��������� < 1000000);

/*������� 3*/
select ������ from ������
where (��������� not like '������') and (��������� > 5000000) and (������� < 100000);

/*������� 4*/
select ������ from ������
where cast(��������� as nvarchar(20)) in ('����� �������','�������� �������') and (��������� > 20000000)
or (��������� like '������') and (��������� > 30000000);

/*������� 5*/
select ������ from ������
where ��������� between 10000000 and 100000000 and (������� < 500000);

/*������� 6*/
select ������ from ������
where ������ not like '�%';

/*������� 7*/
select ������ from ������
where ������ like '__�%�';

/*������� 8*/
select ������ from ������
where ������ like '_[���������]%';

/*������� 9*/
select ������ from ������
where ������ like '[�-�]%';

/*������� 10*/
select ������ from ������
where ������ like '[�-�]%' and ������ not like '�%';

/*������� 11*/
select ������ from ������
where ������� is not null;

/*������� 12*/
select ������ from ������
where cast(��������� as nvarchar(20)) in ('������','�������� �������','����� �������');