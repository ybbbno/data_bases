use lab6;

/*Задание 1*/
select [Name], Surname, Patronymic from Customer where (month([Data of birth]) = month(getdate()));

/*Задание 2*/
/*select [Name], month([Data of birth]) as [Month] from Customer order by month([Data of birth]);*/
/*select distinct month([Data of birth]) as [Month], count(month([Data of birth])) over (partition by month([Data of birth])) as [Count] from Customer;*/

select [Name], datename(month, dateadd(month, month([Data of birth]), -1)) as [Month] from Customer order by datename(month, dateadd(month, month([Data of birth]), -1));

select e.[Name], e.[Month] from (select [Name], datename(month, dateadd(month, month([Data of birth]), -1)) as [Month] from Customer order by datename(month, dateadd(month, month([Data of birth]), -1))) as e;