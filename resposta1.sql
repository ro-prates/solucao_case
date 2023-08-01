-- Contagem de produtos em cada linha de produto
SELECT
  pl.textdescription as linha_produto, -- Nome da linha de produto
  COUNT(p.productCode) As qtd_produtos -- Quantidade de produtos na linha
FROM productlines pl
JOIN products p
ON pl.productLine = p.productLine
GROUP BY 1 -- Agrupa pelo primeiro campo (linha_produto)
ORDER BY 2 DESC; -- Ordena a contagem de produtos em ordem decrescente
