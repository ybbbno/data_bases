use ��;

/*������� 1*/
select [Subject], School, max([Sum]) from ������� group by School, [Subject] with rollup;

/*������� 2*/
select [Subject], School, min([Sum]) from ������� group by School, [Subject] with rollup;

/*������� 3*/
select avg([Sum]) from ������� group by School, [Subject] with rollup;

/*������� 4*/
select iif(grouping([Subject]) = 1, '�����', [Subject]) as [Subject],
iif(grouping(School) = 1, '�����', School) as School,
count(Surname) as [Count] from ������� group by [Subject], School with cube;

/*������� 5*/
select  iif(grouping([Subject]) = 1, '�����', [Subject]) as [Subject],
iif(grouping(School) = 1, '�����', School) as School,
sum([Sum]) as [Sum] from ������� group by [Subject], School with cube;

/*������� 6*/
select  iif(grouping([Subject]) = 1, '�����', [Subject]) as [Subject],
iif(grouping(School) = 1, '�����', School) as School,
max([Sum]) as [Sum] from ������� group by grouping sets([Subject], School);

/*������� 7*/
select �����, �������� from (select School, [Sum] from �������) as source_table
pivot (avg([Sum]) for School in (�����, ��������)) as pivot_table;

/*������� 8*/
select [Subject], �����, �������� from (select School, [Subject], [Sum] from �������) as source_table
pivot (avg([Sum]) for School in (�����, ��������)) as pivot_table;

/*������� 9*/
select col1 from (select Surname, [Subject], School from �������) as source_table
unpivot (col1 for value in (Surname, [Subject], School)) as unpivot_table;