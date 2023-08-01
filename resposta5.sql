WITH RECURSIVE hierarquia AS (
  SELECT 
    employeeNumber, 
    reportsTo, 
    1 AS level
  FROM employees
  WHERE reportsTo IS NULL
  UNION ALL
  SELECT 
    e.employeeNumber, 
    e.reportsTo, 
    h.level + 1
  FROM employees e
  JOIN hierarquia h ON e.reportsTo = h.employeeNumber
)

SELECT 
  employeeNumber AS funcionario, 
  reportsTo AS gerente, 
  level AS nivel
FROM hierarquia
ORDER BY level
