use �������1;
create table ���������(
EmploeeyName varchar(20) not null primary key,
Tel varchar(20) not null,
Title varchar(20) foreign key references Position(PositName),
Branch varchar(20) foreign key references ������(BranchName),
Department varchar(20) foreign key references �����(DepName)
);