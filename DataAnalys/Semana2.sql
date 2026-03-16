------------------ COUNT -------------------
USE EjemploDB

select * from emopleados

SELECT COUNT (*)
FROM emopleados;

SELECT COUNT (nombre)
FROM emopleados;

SELECT COUNT (*) 
FROM emopleados WHERE salario > 15000;

SELECT COUNT(*) AS total_empleados
FROM emopleados;

SELECT COUNT (*) AS menores_a_30
FROM emopleados WHERE edad < 30;

SELECT COUNT(*) as nombres_con_inicial_A
FROM emopleados WHERE nombre LIKE 'a%';

--------------------- OPERADORES----------------- 

select * from emopleados

SELECT SUM(salario)
FROM emopleados;

SELECT SUM(salario) AS Total_Salarios
FROM emopleados

SELECT SUM(salario) AS TOTAL
FROM emopleados WHERE salario > 15000;

SELECT SUM(edad) AS SUMA_EDADES
FROM emopleados;

SELECT SUM(salario) AS SALRIOS_DE_NOMBRE_CON_A
FROM emopleados WHERE nombre LIKE 'A%';

SELECT SUM(salario) AS Total_salario_mayored_de_30
FROM emopleados WHERE edad >=30;

SELECT SUM(salario)
FROM emopleados WHERE salario BETWEEN 15000 AND 30000;

SELECT SUM(salario) AS Total_Salarios
FROM emopleados WHERE edad > 25 AND salario >= 15000;

SELECT SUM(salario) AS TOTAL
FROM emopleados 
WHERE nombre LIKE '%a%';

SELECT SUM(salario) AS SUMA_TOTAL_SALARIOS
FROM emopleados;

SELECT SUM(salario) AS TOTAL
FROM emopleados 
WHERE salario BETWEEN 10000 AND 20000;

SELECT SUM(salario)
FROM (
	SELECT TOP 3 salario
	FROM emopleados 
	ORDER BY salario DESC
) AS TOP_SALARIOS;

SELECT SUM(salario)
FROM emopleados WHERE edad > 25;

SELECT SUM(salario)
FROM emopleados WHERE nombre LIKE 'm%';

SELECT SUM(salario) AS TOTAL
FROM emopleados WHERE salario BETWEEN 8000 AND 10000;

SELECT SUM(salario)
FROM emopleados WHERE salario < 18000 AND nombre LIKE 'a%';

SELECT SUM(salario)
FROM(
	SELECT TOP 2 salario
	FROM emopleados
	ORDER BY salario DESC
)AS Total;

SELECT *
FROM emopleados 

--------------- AVG -------------

SELECT AVG(salario)
FROM emopleados;


SELECT AVG(salario) AS PROMEDIO_salarios
FROM emopleados;

SELECT AVG(salario) AS PROMEDIO
FROM emopleados WHERE salario > 10000;

SELECT AVG(edad) AS promedio_edad
FROM emopleados;

SELECT AVG(salario)
FROM emopleados WHERE edad > 25 AND salario > 15000;

SELECT AVG(salario)
FROM emopleados WHERE salario BETWEEN 8000 AND 10000;

SELECT AVG(salario)
FROM(
	SELECT TOP 3 salario
	FROM emopleados
	ORDER BY salario DESC
) AS Promedio_Mejor_salario;

------------- MIN() MAX()--------------
SELECT MIN(salario) AS salario_minimo
FROM emopleados;

SELECT MAX(salario) AS salario_maximo
FROM emopleados;

SELECT MIN(salario) AS salario_min
FROM emopleados 
WHERE edad > 25;

SELECT MAX(salario) AS salario_maximo
FROM emopleados WHERE edad < 35;

SELECT
MIN(salario) AS minimo,
MAX(salario) AS maximo
FROM emopleados;

SELECT min(nombre), MAX(nombre)
FROM emopleados;

SELECT MIN(salario) AS salario_minimo
FROM emopleados WHERE salario > 10000;

SELECT 
MAX(salario) AS salario_MAXIMO,
MIN(salario) AS salario_MINIMO
FROM emopleados;

SELECT MAX(salario)
FROM emopleados WHERE nombre LIKE 'a%';