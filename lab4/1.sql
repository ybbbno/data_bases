use Академики;

/*Задание 1*/
select ФИО from Академики order by len(trim(ФИО));

/*Задание 2*/
select trim(ФИО) as ФИО from Академики;

/*Задание 3*/
select ФИО, charindex('ов', ФИО) as Индекс from Академики

/*Задание 4*/
select ФИО, right(trim(Специализация), 2) as Буквы from Академики

/*Задание 5*/
select concat(left(ФИО, patindex('% %', ФИО)+1), ' ', left(right(trim(ФИО), patindex('% %', reverse(trim(ФИО)))-1), 1)) from Академики;

/*Задание 6*/
select distinct Специализация, reverse(trim(Специализация)) as Обратное from Академики;

/*Задание 7*/
select replicate('Докторов ', datediff(year, '2005-9-19', getdate())) as Дубликаты;

/*Задание 8*/
select round(square(sin(pi()/2)) - cos (3*pi()/2), 2) as Формула;

/*Задание 9*/
select datediff(day, '2023-9-1', '2023-12-30') as [Конец семестра];

/*Задание 10*/
select datediff(month, '2005-9-19', getdate()) as Месяцы;

/*Задание 11*/
select ФИО, iif(year([Дата рождения]) % 400 = 0, 'Високосный',
			iif(year([Дата рождения]) % 100 = 0, 'Невисокосный',
			iif(year([Дата рождения]) % 4 = 0, 'Високосный', 'Невисокосный'))) as 'Високосность' from Академики;

/*Задание 12*/
select distinct Специализация, iif(len(trim(Специализация)) > 6, 'Длинный', 'Короткий') as Длина from Академики;