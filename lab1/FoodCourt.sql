use �������1;
create table FoodCourt (
PlaceCount int not null,
Branch varchar(20) foreign key references ������(BranchName),
Menu varchar(20) not null,
ID_FoodCoutr int not null primary key,
);