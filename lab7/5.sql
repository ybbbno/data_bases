use lab6;

declare @Students table ([name] nchar(20) not null, age int not null);

begin try
	insert into @Students values (null, null)
end try
begin catch
	print 'Error ' + convert(varchar, error_number()) + ':' + error_message();
end catch