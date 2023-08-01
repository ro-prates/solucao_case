SELECT 
	c.customerName AS nome_cliente, 
  ROUND(SUM(od.quantityOrdered * od.priceEach)::NUMERIC, 2) AS total_gasto
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
HAVING SUM(od.quantityOrdered * od.priceEach) BETWEEN 100000 AND 200000
ORDER BY total_gasto DESC;
