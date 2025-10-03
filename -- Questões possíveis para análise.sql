-- Questões possíveis para análise

-- 1.Quantos descontos indevidos foram registrados no total?
SELECT COUNT(*) AS total_descontos
FROM descontos;


-- 2.Qual o valor total de descontos indevidos aplicados?
SELECT SUM(valor) AS valor_total
FROM descontos;


-- 3.Qual a média de valor dos descontos indevidos?
SELECT ROUND(AVG(valor), 2) AS media_valor
FROM descontos;


-- 4.Qual o maior e o menor valor de desconto indevido?
SELECT MAX(valor) AS maior_valor, MIN(valor) AS menor_valor
FROM descontos;


-- 5.Qual idoso sofreu mais descontos?
SELECT id_idoso, COUNT(*) AS qtd_descontos
FROM descontos
GROUP BY id_idoso
ORDER BY qtd_descontos DESC
LIMIT 1;


-- 6.Qual idoso perdeu mais dinheiro em descontos (soma total)?
SELECT id_idoso, SUM(valor) AS total_perdido
FROM descontos
GROUP BY id_idoso
ORDER BY total_perdido DESC
LIMIT 1;

-- 7.Quantos descontos ocorreram por mês?
SELECT strftime('%Y-%m', data) AS mes, COUNT(*) AS qtd
FROM descontos
GROUP BY mes
ORDER BY mes;


-- 8.Qual foi o motivo mais frequente dos descontos?
SELECT motivo, COUNT(*) AS qtd
FROM descontos
GROUP BY motivo
ORDER BY qtd DESC
LIMIT 1;


-- 9.Em qual data houve mais ocorrências de descontos?
SELECT data, COUNT(*) AS qtd
FROM descontos
GROUP BY data
ORDER BY qtd DESC
LIMIT 1;


-- 10.Qual a média de valor por motivo de desconto?

SELECT motivo, ROUND(AVG(valor), 2) AS media_valor
FROM descontos
GROUP BY motivo
ORDER BY media_valor DESC;
