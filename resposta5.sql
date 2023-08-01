-- Constrói uma hierarquia de funcionários com base nos relacionamentos de gerenciamento.
WITH RECURSIVE hierarquia AS (
  SELECT 
    employeeNumber, -- Número do funcionário
    reportsTo, -- Número do gerente
    1 AS level -- Nível inicial é 1 (representa os funcionários de nível mais alto, ou seja, sem gerente)
  FROM employees
  WHERE reportsTo IS NULL -- Seleciona os funcionários de nível mais alto (sem gerente)

  UNION ALL

  SELECT 
    e.employeeNumber, -- Número do funcionário
    e.reportsTo, -- Número do gerente
    h.level + 1 -- Incrementa o nível hierárquico para cada nível abaixo
  FROM employees e
  JOIN hierarquia h ON e.reportsTo = h.employeeNumber -- Junta com a tabela recursiva para obter os funcionários de nível abaixo
)

-- Seleciona o número do funcionário, o número do gerente e o nível hierárquico de cada funcionário.
SELECT 
  employeeNumber AS funcionario, -- Número do funcionário
  reportsTo AS gerente, -- Número do gerente
  level AS nivel -- Nível hierárquico
FROM hierarquia
ORDER BY level; -- Ordena os resultados em ordem crescente pelo nível hierárquico
