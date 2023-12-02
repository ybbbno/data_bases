use ученики;

/*Задание 1*/
select max([Sum]) - min([Sum]) from Ученики;

/*Задание 2*/
select (select avg([Sum]) from Ученики where trim(School) = N'Лицей') - 
(select avg([Sum]) as [Avg] from Ученики where trim(School) = N'Гимназия');

/*Задание 3*/
if (select Count(*) from Ученики) % 2 = 0 begin select 'true'; end;
else begin select 'false'; end;

/*Задание 4*/
declare @min_num float, @max_num float;
set @min_num = 85;
set @max_num = 90;

select Surname from Ученики where [Sum] between @min_num and @max_num;