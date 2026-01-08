1	23	449.96	2025-07-03	Atraso na revisão
2	22	321.65	2024-11-11	Atraso na revisão
3	39	453.7	2025-04-29	Cobrança indevida
4	32	438.63	2025-05-10	Cobrança indevida
5	14	406.91	2024-11-10	Atraso na revisão
6	48	112.06	2024-10-10	Erro administrativo
7	47	168.94	2024-11-19	Atraso na revisão
8	41	163.05	2024-11-02	Duplicidade de benefício
9	10	247.17	2025-08-26	Cobrança indevida
10	35	430.16	2024-11-27	Cobrança indevida
11	11	107.07	2024-10-22	Cobrança indevida
12	42	473.18	2024-11-07	Atraso na revisão
13	19	182.33	2025-01-13	Erro administrativo
14	46	434.8	2024-10-29	Atraso na revisão
15	7	140.61	2024-10-09	Duplicidade de benefício





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
