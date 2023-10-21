use Задание1;
create table Equipment (
EquipName varchar(20) not null,
Branch varchar(20) foreign key references Филиал(BranchName),
Location varchar(20) not null
);