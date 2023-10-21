use Задание1;
alter table Отдел
add foreign key (DepManager)
references Сотрудник(EmploeeyName);
alter table Филиал
add foreign key (BranchManager)
references Сотрудник(EmploeeyName);