use Академики;

/*Задание 7*/
select concat(concat(upper(left(trim(ФИО), 1)), right(trim(ФИО), len(trim(ФИО))-1)),
	   concat(upper(left(trim(Специализация), 1)), right(trim(Специализация), len(trim(Специализация))-1))) as CamelCase from Академики;

/*Задание 8*/
select ФИО, iif(charindex('-', Специализация)!= 0, concat(left(Специализация, 1), substring(Специализация, charindex('-', Специализация)+1, 1)), left(Специализация, 1)) as [Первая буква] from Академики;

/*Задание 9*/
select ФИО, [Год присвоения звания] - year([Дата рождения]) as [Количество полных лет] from Академики;

/*Задание 11*/
select ФИО, iif(trim(Специализация) = 'зоолог' or trim(Специализация) = 'ботаник', 'биолог', Специализация) as Замена from Академики;

/*Задание 13*/
select ФИО from Академики where len(replace(left(trim(ФИО), patindex('% %', trim(ФИО))-1), 'о', 'оо'))-len(left(trim(ФИО), patindex('% %', trim(ФИО))-1)) > 1;

/*Задание 14*/
select ФИО from Академики where [Год присвоения звания] < (select avg([Год присвоения звания]) from Академики);