/*Задание 1*/
declare @table table ([Номер месяца] int, [Название месяца] nchar(20), [Количество дней] int);
declare @num int;
set @num = 1;

while @num < 12
	begin
		insert @table values (@num, datename(month,dateadd(month,@num,0)-1), day(eomonth(dateadd(month,@num,0))));
		set @num += 1;
	end;

select * from @table;

/*Задание 2*/
go
create function IsPalindrom(@P int)
	returns int
	begin
		return iif(left(@P, len(@P)/2) = reverse(right(@P, len(@P)/2)), 0, 1)
	end;
go
select dbo.IsPalindrom(123321);

/*Задание 3*/
go
create function QQuarter(@x int, @y int)
	returns int
	begin
		return iif(@x > 0 and @y > 0, 1, iif(@x < 0 and @y > 0, 2, iif(@x < 0 and @y < 0, 3, 4)));
	end;
go
select dbo.QQuarter(-1, 1);

/*Задание 4*/
go
create function IsPrime(@N int)
	returns int
	begin
		declare @num int, @bool int;
		set @num = 2;
		set @bool = 0;
		while @num < @N
			begin
				set @bool = iif(@N % @num = 0, 1, 0);
				set @num += 1;
			end;
		return @bool;
	end;
go
select dbo.IsPrime(22);

/*Задание 5*/
drop function dbo.IsPalindrom;
drop function dbo.QQuarter;
drop function dbo.IsPrime;