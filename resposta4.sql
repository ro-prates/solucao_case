-- Retorna o nome do cliente e o total gasto para cada cliente que gastou entre 100.000 e 200.000 unidades monetárias.
SELECT 
  c.customerName AS nome_cliente, -- Nome do cliente
  ROUND(SUM(od.quantityOrdered * od.priceEach)::NUMERIC, 2) AS total_gasto -- Total gasto arredondado
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName

-- A cláusula HAVING filtra os resultados para incluir apenas os clientes cujo total gasto está entre 100.000 e 200.000 unidades monetárias.
-- Isso é feito usando a função de agregação SUM no total gasto e a cláusula BETWEEN para definir o intervalo.
HAVING SUM(od.quantityOrdered * od.priceEach) BETWEEN 100000 AND 200000

ORDER BY total_gasto DESC; -- Ordenação em ordem decrescente pelo total gasto (total_gasto) de cada cliente.
