/*Задание 1*/
go
create proc Зад1 as
begin
	select @@SERVERNAME as [Сервер],
		   DB_NAME() as [База данных],
		   USER_NAME() as [Текущий пользователь],
		   GETDATE() as [Текущее время];
end;

go
exec Зад1;

/*Задание 2*/
go
create proc Зад2 @num int, @amount int output as
begin
	set @amount = 0;
	while @num != 0
	begin
		set @num /= 10;
		set @amount += 1;
	end;
end;

go
declare @amount int;
exec Зад2 1234, @amount output;
select @amount as [Количество цифр];

/*Задание 3*/
go
create proc AddRightDigit @K int, @D int as
begin
	return @K*10 + @D;
end;

go
declare @result int;
exec @result = AddRightDigit 123, 1;
select @result as [Число];

/*Задание 4*/
go
create proc InvDigit @K int output as
begin
	set @K = reverse(@K);
end;

go
declare @K int = 123;
exec InvDigit @K output;
select @K as [Обратное число];

/*Задание 5*/
go
create proc Swap @X float output, @Y float output as
begin
	declare @temp float;
	set @temp = @X;
	set @X = @Y;
	set @Y = @temp;
end;

go
declare @X float = 10.01, @Y float = 12.02;
exec Swap @X output, @Y output;
select @X as [X], @Y as [Y];

/*Задание 6*/
go
create proc SortInc @A float output, @B float output, @C float output as
begin
	declare @temp float, @sorted int;
	set @sorted = 0;

	while @sorted = 0
	begin
		set @sorted = 1;
		if @A > @B
		begin
			set @temp = @A;
			set @A = @B;
			set @B = @temp;
			set @sorted = 0;
		end;
		
		if @B > @C
		begin
			set @temp = @B;
			set @B = @C;
			set @C = @temp;
			set @sorted = 0;
		end;
	end;
end;

go
declare @A float = 3.1, @B float = 2.2, @C float = 1.3;
exec SortInc @A output, @B output, @C output;
select @A as [A], @B as [B], @C as [C];

/*Задание 7*/
go
create proc DigitCountSum @K int, @C int output, @S int output as
begin
	declare @temp int = @C;
	set @C = 0;
	set @S = 0;

	while @K != 0
	begin
		if(@K % 10 = @temp) begin set @C += 1; end;
		set @S += @K % 10;
		set @K /= 10;
	end;
end;

go
declare @K int = 121, @C int = 1, @S int;
exec DigitCountSum @K, @C output, @S output;
select @C as [C], @S as [S];

/*Задание 8*/
go
drop proc Зад1;
drop proc Зад2;
drop proc AddRightDigit;
drop proc InvDigit;
drop proc Swap;
drop proc SortInc;
drop proc DigitCountSum;