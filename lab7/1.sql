/*Задание 1*/
declare @a int, @b int;
set @a = 3;
set @b = 2;

select @a*@b;

/*Задание 2*/
declare @d int, @m int;
set @d = 12;
set @m = 9;

select 'M-'+cast(datepart(month, dateadd(day, 1, datefromparts(2011, @m, @d))) as varchar(2))+';D-'+cast(datepart(day, dateadd(day, 1, datefromparts(2011, @m, @d))) as varchar(2));

/*Задание 3*/
declare @num int, @i int, @sum int;
set @num = 10;
set @i = 1;
set @sum = 0;

while @i <= @num begin
	if @i % 2 != 0 begin
		set @sum = @sum + power(@i, 2);
	end;
	set @i = @i + 1;
end;

select @sum;

/*Задание 4*/
declare @num int;
set @num = 1234;

select (@num / 1000) + (@num / 100 - (@num / 1000 * 10)) + ((@num % 100 - @num % 10) / 10) + (@num % 10);

/*Задание 5*/
declare @a int, @b int, @c int;
set @a = 5;
set @b = 6;
set @c = 3;

if @a < @b begin
	if @a < @c begin select @a; end;
	else if @b < @c begin select @b; end;
	else begin select @c; end;
end;
else if @b < @c begin select @b end;
else begin select @c; end;

/*Задание 6*/
declare @a int;
set @a = 120;
if @a % 11 = 0 begin select 'true'; end;
else begin select 'false' end;

/*Задание 7*/
declare @n int, @i int;
set @n = 2;
set @i = 1;
while @i < @n begin
	set @i = @i * 3;
end;
if @i = @n begin select 'true'; end;
else begin select 'false' end;

/*Задание 8*/
declare @a int, @b int, @m int;
set @a = 100;
set @b = 50;

set @m = @a * @b;
while @a != 0 and @b != 0 begin
	if @a > @b begin
		set @a = @a % @b;
	end;
	else begin
		set @b = @b % @a;
	end;
end;
select @m / (@a + @b);

/*Задание 9*/
declare @a int, @b int, @i int, @sum int;
set @a = 1;
set @b = 5;
set @i = @a;
set @sum = 0;

while @i <= @b begin
	if @i % 2 != 0 begin
		set @sum = @sum + power(@i, 2);
	end;
	set @i = @i + 1;
end;

select @sum;

/*Задание 10*/
declare @num int;
set @num = 1;
while @num < 9999999 begin
	if @num % 2 = 1 and @num % 3 = 1
	and @num % 4 = 1 and @num % 5 = 1
	and @num % 6 = 1 and @num % 7 = 0
	begin
		select @num;
		break;
	end;
	set @num = @num + 1;
end;

/*Задание 11*/
declare @surname nchar(8), @i int;
set @surname = N'Докторов';
set @i = 0;

while @i < len(@surname)/2 begin
	print @surname;
	set @i = @i + 1;
end;

/*Задание 12*/
print @@SERVERNAME;
print DB_NAME();
print USER_NAME();
print GETDATE();

/*Задание 13*/
declare @str nchar(20), @i int;
set @str = N'Нижневартовск';
set @i = 0;

while @i < len(@str) begin
	print reverse(substring(@str, 2, @i)) + substring(@str, 1, 1) + substring(@str, 2, @i);
	set @i = @i + 1;
end;