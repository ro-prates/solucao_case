-- Retorna o nome dos clientes que fizeram pedidos de todas as linhas de produtos disponíveis na tabela productlines.
SELECT 
  c.customerName AS nome_cliente -- Nome do cliente
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
JOIN productlines pl ON p.productLine = pl.productline

GROUP BY c.customerName -- Agrupa os resultados pelo nome do cliente

-- Filtra os resultados para incluir apenas os clientes que fizeram pedidos de todas as linhas de produtos disponíveis.
HAVING COUNT(DISTINCT pl.productline) = (SELECT COUNT(*) FROM productlines);
