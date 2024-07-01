USE video_games_sales

/* Visualizando dados */
SELECT *
FROM vgsales
LIMIT 10

/* Usando o DESCRIBE para ver o tipo das variáveis */
DESCRIBE vgsales

/* Contando o número de registros */
SELECT COUNT(*)
FROM vgsales

/* Verificando valores nulos nas variáveis qualitativas */
SELECT 
    SUM(CASE WHEN `Name` IS NULL THEN 1 ELSE 0 END) AS nulos_name,
    SUM(CASE WHEN `Platform` IS NULL THEN 1 ELSE 0 END) AS nulos_platform,
    SUM(CASE WHEN `Year` IS NULL THEN 1 ELSE 0 END) AS nulos_year,
    SUM(CASE WHEN `Genre` IS NULL THEN 1 ELSE 0 END) AS nulos_genre,
    SUM(CASE WHEN `Publisher` IS NULL THEN 1 ELSE 0 END) AS nulos_publisher
FROM vgsales

/* Verificando valores nulos nas variáveis quantitativas */
SELECT 
    SUM(CASE WHEN `NA_Sales` IS NULL THEN 1 ELSE 0 END) AS nulos_na_sales,
    SUM(CASE WHEN `EU_Sales` IS NULL THEN 1 ELSE 0 END) AS nulos_eu_sales,
    SUM(CASE WHEN `JP_Sales` IS NULL THEN 1 ELSE 0 END) AS nulos_jp_sales,
    SUM(CASE WHEN `Other_Sales` IS NULL THEN 1 ELSE 0 END) AS nulos_other_sales,
    SUM(CASE WHEN `Global_Sales` IS NULL THEN 1 ELSE 0 END) AS nulos_global_sales
FROM vgsales

/* Tabela de frequência das variáveis qualitativas */
SELECT 
    Platform, 
    COUNT(*) AS frequencia_absoluta,
    COUNT(*) / (SELECT COUNT(*) FROM vgsales) * 100 AS frequencia_relativa
FROM 
    vgsales
GROUP BY 
    Platform
ORDER BY 
    frequencia_absoluta DESC;

SELECT 
    Year, 
    COUNT(*) AS frequencia_absoluta,
    COUNT(*) / (SELECT COUNT(*) FROM vgsales) * 100 AS frequencia_relativa
FROM 
    vgsales
GROUP BY 
    Year
ORDER BY 
    frequencia_absoluta DESC;

SELECT 
    Genre, 
    COUNT(*) AS frequencia_absoluta,
    COUNT(*) / (SELECT COUNT(*) FROM vgsales) * 100 AS frequencia_relativa
FROM 
    vgsales
GROUP BY 
    Genre
ORDER BY 
    frequencia_absoluta DESC;

SELECT 
    Publisher, 
    COUNT(*) AS frequencia_absoluta,
    COUNT(*) / (SELECT COUNT(*) FROM vgsales) * 100 AS frequencia_relativa
FROM 
    vgsales
GROUP BY 
    Publisher
ORDER BY 
    frequencia_absoluta DESC;

/* Resumo estatístico das variáveis quantitativas */
SELECT 
    SUM(NA_Sales) AS total_na_sales,
    AVG(NA_Sales) AS media_na_sales,
    MIN(NA_Sales) AS minimo_na_sales,
    MAX(NA_Sales) AS maximo_na_sales,
    STDDEV(NA_Sales) AS desvio_padrao_na_sales
FROM vgsales

SELECT 
    SUM(EU_Sales) AS total_eu_sales,
    AVG(EU_Sales) AS media_eu_sales,
    MIN(EU_Sales) AS minimo_eu_sales,
    MAX(EU_Sales) AS maximo_eu_sales,
    STDDEV(EU_Sales) AS desvio_padrao_eu_sales
FROM vgsales

SELECT 
    SUM(JP_Sales) AS total_jp_sales,
    AVG(JP_Sales) AS media_jp_sales,
    MIN(JP_Sales) AS minimo_jp_sales,
    MAX(JP_Sales) AS maximo_jp_sales,
    STDDEV(JP_Sales) AS desvio_padrao_jp_sales
FROM vgsales

SELECT 
    SUM(Other_Sales) AS total_other_sales,
    AVG(Other_Sales) AS media_other_sales,
    MIN(Other_Sales) AS minimo_other_sales,
    MAX(Other_Sales) AS maximo_other_sales,
    STDDEV(Other_Sales) AS desvio_padrao_other_sales
FROM vgsales


SELECT 
    SUM(Global_Sales) AS total_global_sales,
    AVG(Global_Sales) AS media_global_sales,
    MIN(Global_Sales) AS minimo_global_sales,
    MAX(Global_Sales) AS maximo_global_sales,
    STDDEV(Global_Sales) AS desvio_padrao_global_sales
FROM vgsales

/* Unindo tudo em uma só tabela */

SELECT 'NA_Sales' AS regiao,
       SUM(NA_Sales) AS total_vendas,
       AVG(NA_Sales) AS media_vendas,
       MIN(NA_Sales) AS min_vendas,
       MAX(NA_Sales) AS max_vendas,
       STDDEV(NA_Sales) AS desvpad_vendas
FROM vgsales
UNION ALL
SELECT 'EU_Sales' AS regiao,
       SUM(EU_Sales) AS total_vendas,
       AVG(EU_Sales) AS media_vendas,
       MIN(EU_Sales) AS min_vendas,
       MAX(EU_Sales) AS max_vendas,
       STDDEV(EU_Sales) AS desvpad_vendas
FROM vgsales
UNION ALL
SELECT 'JP_Sales' AS regiao,
       SUM(JP_Sales) AS total_vendas,
       AVG(JP_Sales) AS media_vendas,
       MIN(JP_Sales) AS min_vendas,
       MAX(JP_Sales) AS max_vendas,
       STDDEV(JP_Sales) AS desvpad_vendas
FROM vgsales
UNION ALL
SELECT 'Other_Sales' AS regiao,
       SUM(Other_Sales) AS total_vendas,
       AVG(Other_Sales) AS media_vendas,
       MIN(Other_Sales) AS min_vendas,
       MAX(Other_Sales) AS max_vendas,
       STDDEV(Other_Sales) AS desvpad_vendas
FROM vgsales
UNION ALL
SELECT 'Global_Sales' AS regiao,
       SUM(Global_Sales) AS total_vendas,
       AVG(Global_Sales) AS media_vendas,
       MIN(Global_Sales) AS min_vendas,
       MAX(Global_Sales) AS max_vendas,
       STDDEV(Global_Sales) AS desvpad_vendas
FROM vgsales;

/* Quais os cinco jogos mais vendidos? */
SELECT Name, MAX(Global_Sales) AS global_sales
FROM vgsales
GROUP BY Name
ORDER BY Global_Sales DESC
LIMIT 5

/* De quais gêneros são os jogos mais vendidos? */ 
SELECT Genre, SUM(Global_Sales) AS global_sales
FROM vgsales
GROUP BY Genre
ORDER BY Global_Sales DESC
LIMIT 5

/* De quais consoles são os jogos mais vendidos? */ 
SELECT Platform, SUM(Global_Sales) AS global_sales
FROM vgsales
GROUP BY Platform
ORDER BY Global_Sales DESC
LIMIT 5

/* De quais empresas são os jogos mais vendidos? */ 
SELECT Publisher, SUM(Global_Sales) AS global_sales
FROM vgsales
GROUP BY Publisher
ORDER BY Global_Sales DESC
LIMIT 5

/* Em quais anos foram vendidos mais jogos? */ 
SELECT Year, SUM(Global_Sales) AS global_sales
FROM vgsales
GROUP BY Year
ORDER BY Global_Sales DESC
LIMIT 5
