-- Manipulação e Extração de datas no SQL Server

-- DATEPART
-- DATENAME
-- DATEADD
-- DATEDIFF

select 
OrderDate,
datename(weekday, OrderDate) as "Dia Semana",
datepart(Year, OrderDate),
datepart(Month, OrderDate),
datename(month, OrderDate),
datepart(day, OrderDate),
format(cast('2025-02-03' as datetime), 'dd/MM/yyyy')
from [dbo].[FactSales]



select 
datename(weekday, OrderDate) as "Dia Semana",
count(*) as "Qtd Vendas"
from [dbo].[FactSales]
group by datename(weekday, OrderDate)
order by "Qtd Vendas" desc



select
	SalesOrderID,
	OrderDate,
	dateadd(day, 7, OrderDate) as "Previsão Entrega"
from [SalesLT].[SalesOrderHeader]



select
	SalesOrderID,
	OrderDate,
	dateadd(day, -30, OrderDate)
from [SalesLT].[SalesOrderHeader]
where OrderDate > dateadd(day, -30, getdate())



select
	SalesOrderID,
	OrderDate,
	datediff(second, OrderDate, dateadd(day, -30, getdate())) 
from [SalesLT].[SalesOrderHeader]



-- Manipulação de texto no SQL Server

select
	upper(FirstName),
	lower(LastName),
	replace(EmailAddress, '-', ''),
	left(Phone, 2) as DDD,
	Phone,
	EmailAddress,
	substring(EmailAddress, 1, charindex('@', EmailAddress)-1) as infoEmail,
	substring(EmailAddress, charindex('@', EmailAddress)+1, len(EmailAddress) - charindex('@', EmailAddress)) as DominioEmail
from [SalesLT].[Customer]

