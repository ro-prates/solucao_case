SELECT 
  c.customerName AS nome_cliente
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
JOIN productlines pl ON p.productLine = pl.productline
GROUP BY c.customerName
HAVING COUNT(DISTINCT pl.productline) = (SELECT COUNT(*) FROM productlines);
