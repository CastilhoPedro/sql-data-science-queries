--Exercício 1
select 
	*
from [SalesLT].[SalesOrderHeader]
where 
	OrderDate > '2008-01-01' and
	(TotalDue > 1000 or Status = 5) and
	CustomerID between 20000 and 30000 and
	ShipMethod like '%CARGO TRANSPORT 5%' and
	OnlineOrderFlag = 0 



--Exercício 2
select 
	*
from [SalesLT].[Product]
where 
	Color is not null and
	(ListPrice > 500 or StandardCost > 200) and
	Color <> 'Black' and
	(Weight between 1 and 10 or ProductCategoryID in(4, 5)) and
	ProductNumber like 'BK%'



--Exercício 3
select
	*
from [SalesLT].[Customer]
where 
	FirstName is not null and
	(LastName like 'M%' or LastName like 'S%') and
	CustomerID between 10000 and 50000 and
	(EmailAddress like '%adventure%' or EmailAddress like '%.org') and
	Phone is not null and
	Phone like '1 (%'



