use Задание1;
create table Warehouse (
FoodCourt int foreign key references FoodCourt(ID_FoodCoutr),
Volume int not null,
ID_Warehouse int not null primary key,
);