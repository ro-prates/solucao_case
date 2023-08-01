SELECT 
  ofc.territory AS territorio, 
  CONCAT(e.firstName, ' ', e.lastName) AS representante, 
  ROUND(SUM(od.quantityOrdered * od.priceEach)::numeric, 2) AS total_vendas
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN offices ofc ON e.officeCode = ofc.officeCode
GROUP BY 1, 2
ORDER BY total_vendas DESC;
