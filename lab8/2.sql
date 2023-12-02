use страны;

/*Задание 1*/
go
create view [Африканские страны] as
select * from Страны where Континент = N'Африка' and Население > 10000000 and Площадь > 500000;
go
select * from [Африканские страны];

/*Задание 2*/
go
create view [Континенты] as
select Континент, avg(Население) as [Среднее население], avg(Площадь) as [Средняя площадь] from Страны group by Континент;
go
select * from [Континенты];

/*Задание 3*/
declare @Площадь100 table (Страна nchar(20));

insert @Площадь100
select Страна from Страны where (select avg(Площадь) from Страны)/Площадь >= 100;

select * from @Площадь100;

/*Задание 4*/
select Континент, max(Площадь) as [Max], min(Площадь) as [Min]
into ##Зад4
from Страны group by Континент;

select * from ##Зад4;

/*Задание 5*/
select Страна, Население/Площадь as [Плотность]
into ##Зад5
from Страны

select * from ##Зад5;

/*Задание 6*/
drop view [Африканские страны];
drop view [Континенты];