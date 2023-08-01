SELECT
  pl.textdescription as linha_produto,
  COUNT(p.productCode) As qtd_produtos
FROM productlines pl
JOIN products p
ON pl.productLine = p.productLine
GROUP BY 1
ORDER BY 2 DESC
