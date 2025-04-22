/* 
	O que eu quero saber? 
	Nome do cliente 
	Sobrenome
	E-mail
	Telefone

	Onde estão estas informações?

	Servidor SQL da Azure: srv2501-tamiro 
	Banco de dados: db_2501
	Tabela: SalesLT.Customer

*/ 
-- Primeira consulta em SQL

select top 100 
	FirstName, 
	LastName, 
	EmailAddress, 
	Phone

	from SalesLT.Customer 

	-- Como personalizar o nome das colunas:

select top 100 
	FirstName as nome, 
	LastName as sobrenome, 
	EmailAddress as email, 
	Phone as telefone

	from SalesLT.Customer 