use ��;

/*������� 1*/
select min(�������) as [����������� �������] from ������;

/*������� 2*/
select max(���������) as [������������ ��������� �������] from ������
where ��������� like '%�������%';

/*������� 3*/
select round(avg(���������), 1) as [������� ���������] from ������;

/*������� 4*/
select count(������) as [���������� �����] from ������
where trim(������) like '%��' and not trim(������) like '%����';

/*������� 5*/
select count(A.���������) as [���������� �����������] from
(select ���������, count(������) as Num from ������
where ������ like '�%' group by ���������) A;

/*������� 6*/
select max(�������)/min(�������) as ������� from ������;

/*������� 7*/
select ���������, count(������) as [���������� �����] from ������
where ��������� > 1000000 group by ��������� order by [���������� �����] desc;

/*������� 8*/
select len(trim(������)), count(len(trim(������))) as [���������� �����] from ������
group by len(trim(������)) order by [���������� �����] asc;

/*������� 9*/
select ���������, sum(���������*1.1) as [�������] from ������ group by ���������;

/*������� 10*/
select ���������, (max(�������)/min(�������)) as [�������] from ������
group by ��������� having (max(�������)/min(�������)) < 10000;

/*������� 11*/
select avg(len(trim(������))) as [������� �����] from ������
where ��������� like '������%';

/*������� 12*/
select ���������, avg(���������/�������) as [������� ���������] from ������
where ��������� > 1000000 group by ��������� having avg(���������/�������) > 30;