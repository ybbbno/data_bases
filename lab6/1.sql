use lab6;

/*Задание 1*/
select [Name], Surname, Patronymic from Customer where (month([Data of birth]) = month(getdate()));

/*Звдвние 2*/
select iif(grouping([Name])=1, 'Итого', [Name]) as [Name],
iif(grouping([Name])=1, cast(count(month([Data of birth])) as varchar), datename(month, dateadd(month, month([Data of birth]), -1))) as [Month] from Customer
group by [Name], datename(month, dateadd(month, month([Data of birth]), -1)) with cube;

/*Задание 3*/
select concat([Surname], ' ', [Name], ' ', [Patronymic]) as ФИО, Email, Telephone as Телефон, (select [Name] from Gender where Gender_id = Gender) as Пол from Customer;

/*Задание 4*/
select [Name], (select string_agg(t.[Name], ', ') from [Customer tags] as ct left join Tags as t on ct.Tag = t.Tag_id where ct.Customer = e.Customer_id) as Tags from Customer as e;

/*Задание 5*/
select [Name], (select count(Customer) from Visit where e.Customer_id = Customer) as Visit, (select count(Customer) from Avatar where e.Customer_id = Customer) as Avatar from Customer as e;

/*Задание 6*/
select distinct (select [Name] from Tags where e.Tag=Tag_id) as [Tag], count(Tag) over (partition by Tag) as [Count] from [Customer tags] as e order by [Count] desc;