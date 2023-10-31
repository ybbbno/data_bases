use lab6;

create table Gender(
	[Gender_id] int not null primary key,
	[Name] varchar(30) not null
);

create table Customer(
	[Customer_id] int not null primary key,
	[Gender] int foreign key references Gender(Gender_id),
	[Name] varchar(30) not null,
	[Surname] varchar(30) not null,
	[Patronymic] varchar(30),
	[Data of birth] date not null,
	[Telephone] varchar(30) not null,
	[Email] varchar(30) not null,
	[Date added] date not null
);

create table Visit(
	[Visit_id] int not null primary key,
	[Date] date not null,
	[Customer] int foreign key references Customer(Customer_id)
);

create table Avatar(
	[Avatar_id] int not null primary key,
	[Image] varchar(30),
	[Customer] int foreign key references Customer(Customer_id)
);

create table Tags(
	[Tag_id] int not null primary key,
	[Name] varchar(30) not null,
	[Color] varchar(30) not null
);

create table [Customer tags](
	[Customer] int foreign key references Customer(Customer_id),
	[Tag] int foreign key references Tags(Tag_id)
)