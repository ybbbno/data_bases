use хз;

/*Задание 1*/
select [Subject], School, max([Sum]) from Ученики group by School, [Subject] with rollup;

/*Задание 2*/
select [Subject], School, min([Sum]) from Ученики group by School, [Subject] with rollup;

/*Задание 3*/
select avg([Sum]) from Ученики group by School, [Subject] with rollup;

/*Задание 4*/
select iif(grouping([Subject]) = 1, 'Итого', [Subject]) as [Subject],
iif(grouping(School) = 1, 'Итого', School) as School,
count(Surname) as [Count] from Ученики group by [Subject], School with cube;

/*Задание 5*/
select  iif(grouping([Subject]) = 1, 'Итого', [Subject]) as [Subject],
iif(grouping(School) = 1, 'Итого', School) as School,
sum([Sum]) as [Sum] from Ученики group by [Subject], School with cube;

/*Задание 6*/
select  iif(grouping([Subject]) = 1, 'Итого', [Subject]) as [Subject],
iif(grouping(School) = 1, 'Итого', School) as School,
max([Sum]) as [Sum] from Ученики group by grouping sets([Subject], School);

/*Задание 7*/
select Лицей, Гимназия from (select School, [Sum] from Ученики) as source_table
pivot (avg([Sum]) for School in (Лицей, Гимназия)) as pivot_table;

/*Задание 8*/
select [Subject], Лицей, Гимназия from (select School, [Subject], [Sum] from Ученики) as source_table
pivot (avg([Sum]) for School in (Лицей, Гимназия)) as pivot_table;

/*Задание 9*/
select col1 from (select Surname, [Subject], School from Ученики) as source_table
unpivot (col1 for value in (Surname, [Subject], School)) as unpivot_table;