use хз;

/*Задание 1*/
select min(Площадь) as [Минимальная площадь] from Страны;

/*Задание 2*/
select max(Население) as [Максимальное население Америки] from Страны
where Континент like '%Америка%';

/*Задание 3*/
select round(avg(Население), 1) as [Среднее население] from Страны;

/*Задание 4*/
select count(Страна) as [Количество стран] from Страны
where trim(Страна) like '%ан' and not trim(Страна) like '%стан';

/*Задание 5*/
select count(A.Континент) as [Количество континентов] from
(select Континент, count(Страна) as Num from Страны
where Страна like 'А%' group by Континент) A;

/*Задание 6*/
select max(Площадь)/min(Площадь) as Разница from Страны;

/*Задание 7*/
select Континент, count(Страна) as [Количество стран] from Страны
where Население > 1000000 group by Континент order by [Количество стран] desc;

/*Задание 8*/
select len(trim(Страна)), count(len(trim(Страна))) as [Количество стран] from Страны
group by len(trim(Страна)) order by [Количество стран] asc;

/*Задание 9*/
select Континент, sum(Население*1.1) as [Прогноз] from Страны group by Континент;

/*Задание 10*/
select Континент, (max(Площадь)/min(Площадь)) as [Разница] from Страны
group by Континент having (max(Площадь)/min(Площадь)) < 10000;

/*Задание 11*/
select avg(len(trim(Страна))) as [Средняя длина] from Страны
where Континент like 'Африка%';

/*Задание 12*/
select Континент, avg(Население/Площадь) as [Средняя плотность] from Страны
where Население > 1000000 group by Континент having avg(Население/Площадь) > 30;