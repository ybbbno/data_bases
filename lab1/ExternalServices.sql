use Задание1;
create table ExternalServices(
ExServUnicNamber int not null primary key,
ExServProvider varchar(20) not null,
DataTime date not null,
BranchName varchar(20) foreign key references Филиал(BranchName)
);;