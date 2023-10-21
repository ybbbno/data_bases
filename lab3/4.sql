use Страны;

/*6 запросов на like*/
select Страна from Страны
where Страна like '%ия';

select Страна from Страны
where Континент like '%а';

select Страна from Страны
where Страна like '[б,в]%а';

select Страна from Страны
where Континент like 'а%[а,я]';

select Страна from Страны
where Страна like '%\-%' escape '\';

select Страна from Страны
where Столица like '%\-%' escape '\';

/*union, union all, except, intersect*/
select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like 'а%'
union select cast(Страна as nvarchar(20)) as Страна from Страны where Континент like '%а';

select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like 'а%'
union all select cast(Страна as nvarchar(20)) as Страна from Страны where Континент like '%а';

select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like 'а%'
except select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like '%а';

select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like 'а%'
intersect select cast(Страна as nvarchar(20)) as Страна from Страны where Страна like '%а';

/*where, having, from*/
select Страна from (select Страна from Страны where cast(Континент as nvarchar(20)) = 'Азия') A where Страна like 'б%';

select Население from Страны group by Население having Население > 5000000;

/*insert, update, delete*/
insert into Страны2
select * from Страны where Страна like 'а%';

update Страны2
set Страны2.Страна = Страны.Страна
from Страны where Население > 500000;

delete from Страны2
where Страна in (select Страна from Страны where Страна like 'Бангладеш');

