use Задание1;
create table FoodProducts(
Warehouse int foreign key references Warehouse(ID_Warehouse),
FoodProdVolume int not null,
ExpirationData int not null
);