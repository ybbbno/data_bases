use Страны;

/*Задание 1*/
select Страна from Страны where Площадь < 500000
union all select Страна from Страны where Площадь > 5000000;

/*Задание 2*/
select cast(Страна as nvarchar(20)) as Страна from Страны where Площадь > 1000000
except select cast(Страна as nvarchar(20)) as Страна from Страны where Население < 100000000;

/*Задание 3*/
select cast(Страна as nvarchar(20)) as Страна from Страны where Площадь < 500000
intersect select cast(Страна as nvarchar(20)) as Страна from Страны where Население < 100000;