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
ProductCategoryID as "ID Categoria",
MAX(ListPrice) as "Preço"
FROM SalesLT.Product p 
group by ProductCategoryID 
ORDER by "Preço" DESC 
--dá p usar o alias pra dar order by, em vez de colocar a variável gigante


--quantidade de produtos por categoria (filtrando as que possuem mais de 10 produtos).
SELECT 
ProductCategoryID as "ID Categoria",
COUNT(ProductID) as "Qtd Produtos"
FROM SalesLT.Product p 
group by ProductCategoryID 
HAVING COUNT(ProductID) > 10
 
SELECT * FROM SalesLT.Product p 





