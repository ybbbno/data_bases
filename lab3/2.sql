use ������;

/*������� 1*/
select top 5 ������, �������,
round(cast(������� as float) * 100 / (select sum(�������) from ������), 3) as ������� from ������ order by ������� desc;

/*������� 2*/
select ������ from ������
where ���������/������� > (select avg(���������)/avg(�������) from ������);

/*������� 3*/
select ������ from
(select ������, ��������� from ������ where ��������� like '������') as [������ ������]
where (��������� < 5000000);

/*������� 4*/
select ������, 
round(cast(������� as float) * 100 / (select sum(�������) from ������ � where �.��������� like �.���������),3) as ������� from ������ �;

/*������� 5*/
select ������, 
round(cast(������� as float) * 100 / (select avg(�������) from ������ � where �.��������� like �.���������),3) as ������� from ������ �;

/*������� 6*/
select ������ from ������ �
where (select avg(���������)/avg(�������) from ������ � where �.��������� like �.���������) > (select avg(���������)/avg(�������) from ������);

/*������� 7*/
select ������ from ������
where ��������� > (select max(���������) from ������ where ��������� like '������') and ��������� like '����� �������';

/*������� 8*/
select ������ from ������
where ��������� > (select min(���������) from ������ where ��������� like '����� �������') and ��������� like '������';

/*������� 9*/
select ������ from ������
where ��������� like '������' and exists (select * from ������ where ��������� like '������' and ������� > 2000000);

/*������� 10*/
select ������ from ������
where ��������� like (select ��������� from ������ where ������ like '�����');

/*������� 11*/
select ������ from ������
where ��������� < (select ��������� from ������ where ������ like '�����');

/*������� 12*/
select ������ from ������
where ��������� = (select max(���_���) from (select min(���������) as ���_��� from ������ group by cast(��������� as nvarchar(20))) A)