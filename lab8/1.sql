use students;

/*Задание 1*/
go
create view [teachers] as select * from
(select em.[Name], em.Position, em.[Rank], em.Degree, em.Departament, ex.[Count] from (select Tab_Number, Count(ex.Tab_Number) as [Count] from Exam ex group by ex.Tab_Number) ex
inner join
(select em.[Name], em.Position, em.[Rank], em.Degree, dp.Departament, em.Tab_Number from Departament dp
inner join
(select em.[Name], em.Position, pr.[Rank], pr.Degree, em.Code, pr.Tab_Number from Employee em
inner join
(select Tab_Number, [Rank], Degree from Prof) as pr
on pr.Tab_Number = em.Tab_Number) as em
on dp.Code = em.Code) as em
on ex.Tab_Number = em.Tab_Number) em;

go
select * from [teachers];

/*Задание 2*/

declare @Salaries table (Department nchar(20), [Avg] int);

insert @Salaries
select cast(fc.Departament as nchar(20)), avg(em.Salary) as [Avg] from Faculty fc
inner join
(select em.[Name], dp.Faculty, em.Salary from Departament dp
inner join
(select [Name], Code, Salary from Employee) em
on dp.Code = em.Code) em
on fc.Short = em.Faculty
group by fc.Departament;

select * from @Salaries;

with Employees as (
select em.[Name], em.Departament, em.Salary from
(select em.[Name], fc.Departament, em.Salary from Faculty fc
inner join
(select em.[Name], dp.Faculty, em.Salary from Departament dp
inner join
(select [Name], Code, Salary from Employee) em
on dp.Code = em.Code) em
on fc.Short = em.Faculty) em
)

select em.[Name], em.Departament, em.Salary from Employees em, @Salaries sl where em.Departament = sl.Department and em.Salary < sl.[Avg];

/*Задание 3*/
declare @Exams table ([Номер недели] int, [Количество экзаменов] int, [Количество студентов] int);

insert @Exams values (1, 10, 20), (2, 11, 18), (3, 13, 22);

select [Номер недели], [Количество экзаменов], [Количество студентов] from @Exams where [Количество студентов] <= 20;

/*Задание 4*/
drop view [teachers];