-- Retorna o território, o nome do representante e o total de vendas para cada representante de vendas em cada território.
SELECT 
  ofc.territory AS territorio, -- Território
  CONCAT(e.firstName, ' ', e.lastName) AS representante, -- Nome completo do representante
  ROUND(SUM(od.quantityOrdered * od.priceEach)::numeric, 2) AS total_vendas -- Total de vendas arredondado
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN offices ofc ON e.officeCode = ofc.officeCode
GROUP BY 1, 2 -- Agrupamento por território e representante
ORDER BY total_vendas DESC; -- Ordenação em ordem decrescente pelo total de vendas
