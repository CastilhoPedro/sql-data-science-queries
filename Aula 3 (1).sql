/*

	Como contar linhas com SQL
	
	Exercício: quantos produtos da cor black existem?
*/


SELECT
	COUNT(*), 
	COUNT(
		CASE
		when Color = 'Black' THEN Color 
	END 
) as QtdProdBlack, 
	(COUNT(CASE when Color = 'Black' THEN Color END)*100)/COUNT(*) as "%"
FROM SalesLT.Product p



-- GROUP BY
SELECT 
Color,
COUNT(*)as "Quantidade Produtos",
MIN(ListPrice) as "Menor Preço",
MAX(ListPrice) as "Maior Preço",
AVG(ListPrice) as "Média Valor"
from SalesLT.Product p 
group by Color 
ORDER by Color 



-- Cálculo qtd de vendas e faturamento por produto
SELECT ProductID as "ID Produto",
sum(OrderQty) as "Qtd Vendas",
round(sum(LineTotal), 2) as "Faturamento"
FROM SalesLT.SalesOrderDetail
group by ProductID
 


-- Cálculo qtd de vendas e faturamento por 
SELECT ProductID as "ID Produto",
sum(OrderQty) as "Qtd Vendas",
round(sum(LineTotal), 2) as "Faturamento"
FROM SalesLT.SalesOrderDetail
group by ProductID
having round(sum(LineTotal), 2) > 10000 and avg(OrderQty) > 5



--maior preço por categoria de produto
SELECT 
pc.Name as "ID Categoria",
MAX(ListPrice) as "Preço"
FROM SalesLT.Product p 
join SalesLT.ProductCategory pc 
	on p.ProductCategoryID = pc.ProductCategoryID 
group by pc.Name 
ORDER by "Preço" DESC 
--dá p usar o alias pra dar order by, em vez de colocar a variável gigante


--quantidade de produtos por categoria (filtrando as que possuem mais de 10 produtos).
SELECT 
pc.Name as "Categoria",
COUNT(p.ProductID) as "Qtd Produtos"
FROM SalesLT.Product p 
join SalesLT.ProductCategory pc 
	on p.ProductCategoryID = pc.ProductCategoryID 
group by pc.Name 
HAVING COUNT(p.ProductID) > 10







-- RFV (Recência, Frequência e valor)
SELECT 
CustomerID as "ID Cliente", 
max(OrderDate) as "Data Última Compra",
count(CustomerID) as "Quantidade de Compras",
sum(TotalDue) as "Total $$$"
from SalesLt.SalesOrderHeader
group by CustomerID



--RFV com join
SELECT 
c.FirstName + ' ' + c.LastName as "ID Cliente", 
max(soh.OrderDate) as "Data Última Compra",
count(soh.CustomerID) as "Quantidade de Compras",
sum(soh.TotalDue) as "Total $$$"
from SalesLt.SalesOrderHeader soh
join SalesLT.Customer c 
	on soh.CustomerID = c.CustomerID 
group by c.FirstName + ' ' + c.LastName




SELECT 
p.Name, 
AVG(sod.OrderQty) as "Média" 
FROM SalesLT.SalesOrderDetail sod 
join SalesLT.Product p 
	on sod.ProductID = p.ProductID 
GROUP BY p.Name 
order by "Média" desc


SELECT 
OrderDate, 
YEAR(OrderDate),
MONTH(OrderDate),
round(sum(TotalDue), 2)
FROM SalesLT.SalesOrderHeader soh
group by 
OrderDate, 
YEAR(OrderDate),
MONTH(OrderDate)
















