use Страны;

/*Задание 1*/
select top 5 Страна, Столица,
round(cast(Площадь as float) * 100 / (select sum(Площадь) from Страны), 3) as Процент from Страны order by Процент desc;

/*Задание 2*/
select Страна from Страны
where Население/Площадь > (select avg(Население)/avg(Площадь) from Страны);

/*Задание 3*/
select Страна from
(select Страна, Население from Страны where Континент like 'Европа') as [Страны Европы]
where (Население < 5000000);

/*Задание 4*/
select Страна, 
round(cast(Площадь as float) * 100 / (select sum(Площадь) from Страны Б where Б.Континент like А.Континент),3) as Процент from Страны А;

/*Задание 5*/
select Страна, 
round(cast(Площадь as float) * 100 / (select avg(Площадь) from Страны Б where Б.Континент like А.Континент),3) as Процент from Страны А;

/*Задание 6*/
select Страна from Страны А
where (select avg(Население)/avg(Площадь) from Страны Б where Б.Континент like А.Континент) > (select avg(Население)/avg(Площадь) from Страны);

/*Задание 7*/
select Страна from Страны
where Население > (select max(Население) from Страны where Континент like 'Африка') and Континент like 'Южная Америка';

/*Задание 8*/
select Страна from Страны
where Население > (select min(Население) from Страны where Континент like 'Южная Америка') and Континент like 'Африка';

/*Задание 9*/
select Страна from Страны
where Континент like 'Африка' and exists (select * from Страны where Континент like 'Африка' and Площадь > 2000000);

/*Задание 10*/
select Страна from Страны
where Континент like (select Континент from Страны where Страна like 'Алжир');

/*Задание 11*/
select Страна from Страны
where Население < (select Население from Страны where Страна like 'Алжир');

/*Задание 12*/
select Страна from Страны
where Население = (select max(Мин_нас) from (select min(Население) as Мин_нас from Страны group by cast(Континент as nvarchar(20))) A)