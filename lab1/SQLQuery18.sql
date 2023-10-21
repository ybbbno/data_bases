use Задание2;
create table Account(
ID_Account int,
Client varchar(20),
Amount int not null,

foreign key (ID_Account, Client)
);