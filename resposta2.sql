WITH vendas_mensais AS (
  SELECT 
    pl.textDescription AS linha_produto,
    EXTRACT(MONTH FROM o.orderDate) AS mes,
    SUM(od.quantityOrdered) AS qtd_vendida
  FROM productlines pl
  JOIN products p ON pl.productline = p.productLine
  JOIN orderdetails od ON od.productCode = p.productCode
  JOIN orders o ON o.orderNumber = od.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2005
  GROUP BY 1, 2
)

, rank_vendas AS (
    SELECT 
      linha_produto, 
      mes, 
      qtd_vendida,
      RANK() OVER (PARTITION BY mes ORDER BY qtd_vendida DESC) AS posicao
    FROM vendas_mensais
)

SELECT 
  linha_produto, 
  mes
FROM rank_vendas
WHERE posicao = 1;
