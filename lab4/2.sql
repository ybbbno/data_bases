use ���������;

/*������� 7*/
select concat(concat(upper(left(trim(���), 1)), right(trim(���), len(trim(���))-1)),
	   concat(upper(left(trim(�������������), 1)), right(trim(�������������), len(trim(�������������))-1))) as CamelCase from ���������;

/*������� 8*/
select ���, iif(charindex('-', �������������)!= 0, concat(left(�������������, 1), substring(�������������, charindex('-', �������������)+1, 1)), left(�������������, 1)) as [������ �����] from ���������;

/*������� 9*/
select ���, [��� ���������� ������] - year([���� ��������]) as [���������� ������ ���] from ���������;

/*������� 11*/
select ���, iif(trim(�������������) = '������' or trim(�������������) = '�������', '������', �������������) as ������ from ���������;

/*������� 13*/
select ��� from ��������� where len(replace(left(trim(���), patindex('% %', trim(���))-1), '�', '��'))-len(left(trim(���), patindex('% %', trim(���))-1)) > 1;

/*������� 14*/
select ��� from ��������� where [��� ���������� ������] < (select avg([��� ���������� ������]) from ���������);