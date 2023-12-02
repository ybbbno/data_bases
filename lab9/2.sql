use страны;

/*Задание 1*/
go
create proc Зад1 as
select Страна, Столица from Страны p1 where Население / Площадь > (select avg(Население) / avg(Площадь) from Страны p2 where p1.Континент = p2.Континент);

go
exec Зад1;

/*Задание 2*/
go
create proc Зад2 as
select Страна, Столица, Площадь, Население, Континент from Страны;

go
exec Зад2;

/*Задание 3*/
go
create proc Зад3 @континент nchar(20) as
select Страна from Страны where Континент = @континент;

go
exec Зад3 N'Азия';

/*Задание 4*/
go
create proc Зад4 @min int, @max int as
select Страна from Страны where Население between @min and @max;

go
exec Зад4 100000, 1000000;

/*Задание 5*/
go
create proc Зад5 @alp nchar(1) as
select count(Страна) from Страны where Страна not like '%'+@alp+'%';

go
exec Зад5 N'я';

/*Задание 6*/
go
create proc Зад6 @континент nchar(20) = N'Африка' as
select top 5 Страна from Страны where Континент = @континент order by Население desc;

go
exec Зад6;

/*Задание 7*/
go
create proc Зад7 as
create table Страны_Д (Страна nchar(20));
insert into Страны_Д (Страна)
select Страна from Страны where Страна like N'А%';
select * from Страны_Д;

go
exec Зад7;

/*Задание 8*/
go
create proc Зад8 as
select count(Страна) from Страны_Д; 
drop table Страны_Д;

go
exec Зад8;

/*Задание 9*/
go
drop proc Зад1;
drop proc Зад2;
drop proc Зад3;
drop proc Зад4;
drop proc Зад5;
drop proc Зад6;
drop proc Зад7;
drop proc Зад8;