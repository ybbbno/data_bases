use ���������;

/*������� 1*/
select ��� from ��������� order by len(trim(���));

/*������� 2*/
select trim(���) as ��� from ���������;

/*������� 3*/
select ���, charindex('��', ���) as ������ from ���������

/*������� 4*/
select ���, right(trim(�������������), 2) as ����� from ���������

/*������� 5*/
select concat(left(���, patindex('% %', ���)+1), ' ', left(right(trim(���), patindex('% %', reverse(trim(���)))-1), 1)) from ���������;

/*������� 6*/
select distinct �������������, reverse(trim(�������������)) as �������� from ���������;

/*������� 7*/
select replicate('�������� ', datediff(year, '2005-9-19', getdate())) as ���������;

/*������� 8*/
select round(square(sin(pi()/2)) - cos (3*pi()/2), 2) as �������;

/*������� 9*/
select datediff(day, '2023-9-1', '2023-12-30') as [����� ��������];

/*������� 10*/
select datediff(month, '2005-9-19', getdate()) as ������;

/*������� 11*/
select ���, iif(year([���� ��������]) % 400 = 0, '����������',
			iif(year([���� ��������]) % 100 = 0, '������������',
			iif(year([���� ��������]) % 4 = 0, '����������', '������������'))) as '������������' from ���������;

/*������� 12*/
select distinct �������������, iif(len(trim(�������������)) > 6, '�������', '��������') as ����� from ���������;