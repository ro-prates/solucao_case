-- Calcula as vendas mensais de cada produto em 2005.
WITH vendas_mensais AS (
  SELECT 
    pl.textDescription AS linha_produto, -- Nome da linha de produto
    EXTRACT(MONTH FROM o.orderDate) AS mes, -- Extrai o mês da data do pedido
    SUM(od.quantityOrdered) AS qtd_vendida -- Quantidade total vendida do produto no mês
  FROM productlines pl
  JOIN products p ON pl.productline = p.productLine
  JOIN orderdetails od ON od.productCode = p.productCode
  JOIN orders o ON o.orderNumber = od.orderNumber
  WHERE EXTRACT(YEAR FROM o.orderDate) = 2005 -- Filtro para o ano de 2005
  GROUP BY 1, 2 -- Agrupa por linha_produto e mês
)

-- Calcula a posição de cada produto em cada mês com base na quantidade total vendida.
, rank_vendas AS (
    SELECT 
      linha_produto, 
      mes, 
      qtd_vendida,
      RANK() OVER (PARTITION BY mes ORDER BY qtd_vendida DESC) AS posicao -- RANK em ordem decrescente da quantidade vendida para cada mês
    FROM vendas_mensais
)

-- Seleciona o produto mais vendido em cada mês (posicao = 1).
SELECT 
  linha_produto, 
  mes
FROM rank_vendas
WHERE posicao = 1; -- Filtro para pegar apenas o produto mais vendido em cada mês
