use ученики;

/*Задание 1*/
go
create trigger Зад1 on Ученики after update as
print N'Запись изменена';

go
update Ученики set School = N'Гимназия1' where School = N'Лицей';
update Ученики set School = N'Лицей' where School = N'Гимназия1';

/*Задание 2*/
go
create trigger Зад2 on Ученики after insert, delete as
print N'Количество строк изменено';

go
insert into Ученики values (11, N'Ааа', N'Ааа', N'Ааа', 33.1);
delete Ученики where ID = 11;

/*Задание 3*/
go
create trigger Зад3 on Ученики after insert, update, delete as
print user_name()+N' изменил таблицу. Время: '+convert(nchar, getdate());

go
insert into Ученики values (11, N'Ааа', N'Ааа', N'Ааа', 33.1);
update Ученики set School = N'Гимназия1' where ID = 11;
delete Ученики where ID = 11;

/*Задание 4*/
go
create trigger Зад4 on Ученики instead of update as
print N'Нельзя редактировать данные';

go
update Ученики set School = N'Гимназия1' where School = N'Лицей';
update Ученики set School = N'Лицей' where School = N'Гимназия1';

/*Задание 5*/
go
create table Ученики_Докторов (Фамилия nchar(20), Дата date);

go
create trigger Зад5 on Ученики after delete as
insert into Ученики_Докторов (Фамилия, Дата)
select Surname as Фамилия, getdate() as Дата from deleted p1
where (select count(Surname) from Ученики p2 where p1.Surname = p2.Surname) > 0;

/*Задание 6*/
go
disable trigger Зад1 on Ученики;
disable trigger Зад2 on Ученики;
disable trigger Зад3 on Ученики;
disable trigger Зад4 on Ученики;

go
insert into Ученики values (11, N'Ааа', N'Ааа', N'Ааа', 33.1);
delete Ученики where ID = 11;
insert into Ученики values (11, N'Иванова', N'Ааа', N'Ааа', 33.1);
delete Ученики where ID = 11;

go
select * from Ученики_Докторов;

/*Задание 7*/
go
drop trigger Зад1;
drop trigger Зад2;
drop trigger Зад3;
drop trigger Зад4;
drop trigger Зад5;
drop table Ученики_Докторов;