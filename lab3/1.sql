use Страны;

/*Задание 1*/
select top 5 Страна, Столица from Страны order by Площадь desc;

/*Задание 2*/
select Страна from Страны
where (Континент like 'Африка') and (Население < 1000000);

/*Задание 3*/
select Страна from Страны
where (Континент not like 'Европа') and (Население > 5000000) and (Площадь < 100000);

/*Задание 4*/
select Страна from Страны
where cast(Континент as nvarchar(20)) in ('Южная Америка','Северная Америка') and (Население > 20000000)
or (Континент like 'Африка') and (Население > 30000000);

/*Задание 5*/
select Страна from Страны
where Население between 10000000 and 100000000 and (Площадь < 500000);

/*Задание 6*/
select Страна from Страны
where Страна not like 'К%';

/*Задание 7*/
select Страна from Страны
where Страна like '__а%и';

/*Задание 8*/
select Страна from Страны
where Страна like '_[ауоиэыяюе]%';

/*Задание 9*/
select Страна from Страны
where Страна like '[к-п]%';

/*Задание 10*/
select Страна from Страны
where Страна like '[а-г]%' and Страна not like 'б%';

/*Задание 11*/
select Страна from Страны
where Столица is not null;

/*Задание 12*/
select Страна from Страны
where cast(Континент as nvarchar(20)) in ('Африка','Северная Америка','Южная Америка');