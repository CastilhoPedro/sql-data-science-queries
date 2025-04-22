SELECT UnitPriceDiscount,
CASE 
	when UnitPriceDiscount != 0 THEN 1
	else 0
END as TeveDesconto
from SalesLT.SalesOrderDetail



--usando a estrutura qcase when, usando a faixa de preço do produto, categorizar a faixa de valor ( < 100 = barato, 100 < 500 = moderado, >500 = caro)
SELECT 
	Name, 
	ListPrice,
CASE 
	when ListPrice < 100 then 'Barato'
	when ListPrice between 100 and 500 then 'moderado'
	else 'Caro'
END as "Faixa Valor"
FROM SalesLT.Product   



SELECT 
	SalesOrderID,
	TotalDue,
CASE 
	when TotalDue  < 1000 then (TotalDue *0.95)
	when TotalDue  between 1000 and 5000 then TotalDue *0.9
	ELSE TotalDue * 0.85
END as "LineTotal with Discount",
CASE 
	WHEN TotalDue  < 1000 then TotalDue *0.05
	when TotalDue  between 1000 and 5000 then TotalDue *0.1
	ELSE TotalDue * 0.15
END as "Discount Apllied"
from SalesLT.SalesOrderHeader soh  
order by 
	"Discount Apllied" DESC 


SELECT
	SalesOrderID,
	Status,
CASE 
	when Status = 1 then 'Aprovado'
	WHEN Status  = 2 then 'Em processamento'
	WHEN Status  = 3 then 'Finalizado'
	ELSE 'Indefinido'
END as DescribedStatus
FROM SalesLT.SalesOrderHeader soh 



SELECT 
	StandardCost,
	ListPrice,
	CASE 
		when ListPrice < StandardCost then 'Margem negativa'
		when ListPrice = StandardCost then 'Margem neutra'
		ELSE 'Margem positiva'
	END as "Margem Lucro"
FROM SalesLT.Product p 


-- Count
SELECT 
	COUNT(SalesOrderID) as "Quantidade de Vendas",
	COUNT(*) as "Qtd de Vendas"
from SalesLT.SalesOrderHeader soh 



-- Group By
-- Existem qtos produtos da cor black?


SELECT COUNT(ProductID),
COUNT(CASE 
	when Color  = 'Black' THEN Color 
END) AS "Prod Black",
(COUNT(CASE when Color  = 'Black' THEN Color END)*100)/COUNT(ProductID) as 'porcentagem',
--medidas de posição
ROUND(MIN(ListPrice), 2) as "Valor Mínimo",
round(AVG(ListPrice), 2) as "Média",
round(MAX(ListPrice), 2) as "Valor Máximo",
--medidas de dispersão
stdev(ListPrice) as "Desvio Padrão",
var(ListPrice) as "Variância"
FROM SalesLT.Product p 


SELECT ProductID, 
SUM(OrderQty) 
FROM SalesLT.SalesOrderDetail sod 
group by ProductID 







