use страны;

/*Задание 1*/
declare @avg_world_population float;
set @avg_world_population = (select avg(Население) from Страны)/(select avg(Площадь) from Страны);

select Страна, Континент from Страны ст where @avg_world_population < (select avg(Население) from Страны where trim(Континент) = ст.Континент)/(select avg(Площадь) from Страны where trim(Континент) = ст.Континент);

/*Задание 2*/
declare @avg_world_area float;
set @avg_world_area = (select avg(Площадь) from Страны);

select Страна, (Площадь / @avg_world_area * 100) as Процент from Страны;

/*Задание 3*/
select Страна, Население/Площадь from Страны where @avg_world_population < Население/Площадь;