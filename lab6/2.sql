use students;

/*Задание 1*/
select st.Reg_Number, st.[Name], d.Faculty from Student st, Speciality sp, Departament d
where st.Number = sp.Number and sp.Code = d.Code;

/*Задание 2*/
select distinct d.Faculty, d.Code, d.Departament, e.[Name] from Departament d, Speciality sp, Employee e
where e.Code = d.Code and sp.Code = d.Code;

/*Задание 3*/
select e1.[Name], e2.Tab_Number, iif(e1.[Name] = e2.[Name], null, e2.[Name]) as Руководитель from Employee e1
inner join Employee e2 on e1.Tab_Number = e2.Chief;

/*Задание 4*/
select st.[Name] from Student st
inner join
(select Reg_Number, Count(Tab_Number) as [Count] from Exam group by Reg_Number) ex on st.Reg_Number = ex.Reg_Number
where ex.[Count] >= 2;

/*Задание 5*/
select em.[Name] from Employee em
inner join 
(select Num, Spec from Engineer unpivot (Spec for Num in ([153], [241], [242], [435], [614])) as unp) en
on em.Tab_Number = en.Num where em.Salary < 20000;

/*Задание 6*/
declare @cab nchar(4);
set @cab = N'т505';

select st.[Name] from Student st
inner join (select Reg_Number from Exam where [Location] = @cab) ex
on st.Reg_Number = ex.Reg_Number;

/*Задание 7*/
declare @grade int;
set @grade = 4;

select st.Reg_Number, st.[Name], ex.[Count], ex.[Avg] from Student st
inner join
(select Reg_Number, count(Reg_Number) as [Count], avg(Mark) as [Avg] from Exam group by Reg_Number) ex
on st.Reg_Number = ex.Reg_number where ex.[Avg] >= @grade;

/*Задание 8*/
select em.[Name], em.Salary, ch.[Exp] from Employee em
inner join
(select Num, [Exp] from Chiefs
unpivot ([Exp] for Num in ([101], [201], [301], [401], [501], [601])) as unp) ch
on em.Tab_Number = ch.Num;

/*Задание 9*/
select em.[Name] from Employee em
inner join Prof pr on em.Tab_Number = pr.Tab_Number;

/*Задание 10*/
declare @start_date date, @end_date date;
set @start_date = '2015-06-05';
set @end_date = '2015-06-09';

select em.[Subject], em.[Name], em.Position, pr.Degree, em.[Date], em.[Location] from Prof pr
inner join
(select sb.[Subject], em.[Name], em.Position, sb.Tab_Number, sb.[Date], sb.[Location] from Employee em
inner join
(select sb.[Subject], ex.Tab_Number, ex.[Date], ex.[Location] from [Subject] sb
inner join
(select Code, Tab_Number, [Date], [Location] from Exam where [Date] between @start_date and @end_date) ex
on sb.Code = ex.Code) sb
on sb.Tab_Number = em.Tab_Number) em
on pr.Tab_Number = em.Tab_Number;

/*Задание 11*/
select em.[Name] from Employee em
inner join
(select ex.Tab_Number from
(select Tab_Number, Count(Tab_Number) as [Count] from Exam group by Tab_Number) ex
where ex.[Count] > 3) ex
on em.Tab_Number = ex.Tab_Number;

/*Задание 12*/
declare @date date;
set @date = '2015-06-05';

select st.[Name] from Student st
inner join
(select distinct Reg_Number from Exam where Reg_Number not in
(select distinct Reg_Number from Exam where [Date] = @date)) ex
on st.Reg_Number = ex.Reg_Number;