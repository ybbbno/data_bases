use страны;

/*Задание 1*/
go
create function CountryByCapital (@capital nchar(20))
	returns nchar(20)
	begin
		declare @country nchar(20);
		set @country = (select Страна from Страны where Столица = @capital);
		return @country;
	end;
go
select dbo.CountryByCapital(N'Вена');

/*Задание 2*/
go
create function PopulationToMillion (@population int)
	returns int
	begin
		return @population / 1000000;
	end;
go
select dbo.PopulationToMillion(Население) from Страны;

/*Задание 3
ошибка*/
go
create function PopulationDensity (@continent nchar(20))
	returns float
	begin
		return (select sum(Население/Площадь) from Страны where Континент = @continent);
	end;
go
select dbo.PopulationDensity(N'Азия');

/*Задание 4*/
go
create function FindThirdCountry ()
	returns nchar(20)
	begin
		return (select Страна from (select row_number() over(order by Население desc) as id, Страна, Население from Страны) st where id = 3);
	end;
go
select dbo.FindThirdCountry();

/*Задание 5*/
go
create function FindMaxCountryByContinent (@continent nchar(20) = N'Азия')
	returns int
	begin
		return (select Население from (select row_number() over(order by Население desc) as id, Страна, Население from Страны where Континент = @continent) st where id = 1);
	end;
go
select dbo.FindMaxCountryByContinent(N'Африка');

/*Задание 6
ошибка*/
go
create function ChangeCharacters (@string nchar(100))
	returns nchar(100)
	begin
		declare @num int, @num2 int, @max int;
		set @num = 3;
		set @num2 = 3;
		set @max = len(@string);
		while @num <= @max
			begin
				set @string = concat(substring(@string, 1, @num2-1), N'тест', substring(@string, @num2+1, len(@string)));
				/*set @string = substring(@string, @num2, 1, N'тест');*/
				set @num += 1;
				set @num2 += 4;
			end;
		return @string;
	end;
go
select dbo.ChangeCharacters(Столица), Столица from Страны;

/*Задание 7*/
go
create function CountCountriesByLetter (@letter nchar(1))
	returns int
	begin
		return (select count(*) from Страны where Страна not like '%'+@letter+'%');
	end;
go
select dbo.CountCountriesByLetter(N'в');

/*Задание 8*/
go
create function CountriesByArea (@area int)
	returns table as
	return (select Страна from Страны where Площадь < @area);
go
select * from dbo.CountriesByArea(100000);

/*Задание 9*/
go
create function CountriesByPopulation (@min int, @max int)
	returns table as
	return (select Страна from Страны where Население between @min and @max);
go
select * from dbo.CountriesByPopulation(100000, 1000000);

/*Задание 10*/
go
create function IDK ()
	returns @table table (Континент nchar(20), Население int) as
	begin
		insert into @table
		select Континент, sum(Население) from Страны group by Континент;

		return;
	end;
go
select * from dbo.IDK();

/*Задание 11*/
drop function dbo.CountryByCapital;
drop function dbo.PopulationToMillion;
drop function dbo.PopulationDensity;
drop function dbo.FindThirdCountry;
drop function dbo.FindMaxCountryByContinent;
drop function dbo.ChangeCharacters;
drop function dbo.CountCountriesByLetter;
drop function dbo.CountriesByArea;
drop function dbo.CountriesByPopulation;
drop function dbo.IDK;