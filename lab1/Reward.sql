use �������1;
create table Reward(
EmploeeyName varchar(20) foreign key references ���������(EmploeeyName),
RewardKind varchar(20) not null,
DateTime datetime not null,
RewardAmount int not null
);