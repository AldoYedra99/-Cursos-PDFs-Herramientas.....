USE EjemploDB

--------------------- CASE --------------------------------

'''
CASE: sirve para crear lògica condicional dentro de una consulta, similar a IF / ELSE
en programaciòn de culaquier otro lebguaje. ¿Que hace CASE? Permite clasificar datos:

SELECT
CASE 
	WHEN condicion THEN resultado
	WHEN condicion THEN resultado
	ELSE resultado
END 
FROM tabla;'''

SELECT nombre, salario,
CASE
	WHEN salario >= 15000 THEN 'Alto'
	WHEN salario >= 10000 THEN 'Bajo'
	ELSE 'Bajo'
END AS Nivel_Salario
FROM emopleados;

SELECT
e.nombre,
a.nombre,
CASE
	WHEN e.salario > 15000 THEN 'Alto'
	ELSE 'Normal'
END AS Nivel
FROM emopleados e
JOIN Area a
ON e.AreaID = a.AreaID;

SELECT 
CASE
	WHEN salario >= 15000 THEN 'Alto'
	ELSE 'Normal'
END AS Nivel_Salario,
COUNT(*) AS Total
FROM emopleados
GROUP BY
CASE
	WHEN salario >= 15000 THEN 'Alto'
	ELSE 'Normal'
END;

SELECT salario,
CASE 
	WHEN salario >=15000 THEN 'Alto'
	ELSE 'Normal'
END AS Salarios
FROM emopleados;

SELECT nombre, edad,
CASE
	WHEN edad > 29 THEN 'Senior'
	ELSE 'Junior'
END AS Categoria
FROM emopleados;

SELECT nombre, salario,
CASE
	WHEN salario >= 18000 THEN 'Excelente'
	WHEN salario >= 12000 THEN 'Bueno'
	ELSE 'Basico'
END AS Clasificacion
FROM emopleados;

SELECT nombre, salario,
CASE
	WHEN salario < 10000 THEN 'Bajo'
	WHEN salario BETWEEN 10000 AND 20000 THEN 'Medio'
	WHEN salario > 20000 THEN 'Alto'
END AS Categoria_Salarial
FROM emopleados;

--------------- CTE ---------------------------
'¿Que es un CTE? (Common Table Expression) es una consulta temporal 
que se puede usar dentro de otra consulta
Sirve para:
* Hacer consultas màs claras
* Dividir problemas complejos
* Reutilizar resultados'

WITH salarioa_altos AS(
	SELECT nombre, salario
	FROM emopleados
	WHERE salario > 12000
	)
SELECT * 
FROM salarioa_altos;

WITH promedio_salario AS(
	SELECT AVG(salario) AS promedio
	FROM emopleados
	)
SELECT * FROM promedio_salario;

WITH salarios_altos AS(
	SELECT nombre, salario
	FROM emopleados 
	WHERE salario > 12000
	)
SELECT * FROM salarios_altos
ORDER BY salario DESC;

WITH promedio AS(
	SELECT AVG(salario) AS promedio_salario
	FROM emopleados
	)
SELECT nombre, salario
FROM emopleados
WHERE salario > (SELECT promedio_salario FROM promedio);

WITH salario_mayor AS(
	SELECT nombre, salario 
	FROM emopleados 
	WHERE salario >10000
	)
SELECT * FROM salario_mayor

WITH CTEpromedio AS(
	SELECT AVG(salario)AS promedio
	FROM emopleados 
	)
Select nombre, salario
FROM emopleados
WHERE salario > (SELECT * FROM CTEpromedio);

WITH top_salario AS(
	SELECT nombre, salario
	FROM emopleados
	)
SELECT * FROM top_salario
ORDER BY salario DESC;

WITH clasificacion AS(
	SELECT nombre, salario,
		CASE
		WHEN salario > 15000 THEN 'Alto'
		ELSE 'Normal'
	END AS categori
	FROM emopleados
	)
SELECT * FROM clasificacion

WITH promedio_salario AS(
	SELECT AVG(salario) AS promedio
	FROM emopleados
	)
SELECT nombre, salario
FROM emopleados
WHERE salario > (SELECT * FROM promedio_salario);

WITH top_salarios AS(
	SELECT TOP 2 nombre, salario
	FROM emopleados
	ORDER BY salario DESC
	)
SELECT * FROM top_salarios

------------------Window Functions (OVER, RANK, ROW_NUMBER)-------------------
'Window Functions (Funciones de Ventana)
Permiten hacer calculos sin agrupar los datos
¿Que significa esto?
En GROUP BY pierdes filas
EJEMPLO:'
SELECT AreaID, AVG(salario) AS promArea
FROM emopleados
GROUP BY AreaID;
'Solo obtenemos un resultado por Area
Con Window Functions no pierdes filas
OVER() define la ventana de calculo'
SELECT nombre, salario,
	AVG(salario) OVER() AS promEmpresa
FROM emopleados;

SELECT
nombre,
salario,
ROW_NUMBER() OVER(ORDER BY salario DESC) AS Ranking
FROM emopleados;

SELECT nombre, salario,
	RANK() OVER(ORDER BY salario DESC) AS Ranking
FROM emopleados;

SELECT nombre, salario,
DENSE_RANK() OVER(ORDER BY salario DESC) AS Ranking
FROM emopleados;

SELECT nombre, AreaID, salario,
	AVG(salario) OVER(PARTITION BY AreaID) AS promArea
FROM emopleados;

SELECT e.nombre, 
	a.nombre AS departamento, 
	e.salario, 
	AVG(e.salario) OVER(PARTITION BY a.nombre) AS promArea
FROM emopleados e
LEFT JOIN Area a
ON e.AreaID = a.AreaID;

SELECT e.nombre,
	a.nombre AS departamento, 
	e.salario,
	RANK() OVER(PARTITION BY a.AreaID 
	ORDER BY e.salario DESC) AS RANKING
FROM emopleados e
LEFT JOIN Area a
ON e.AreaID = a.AreaID;

SELECT nombre, AreaID, salario,
	RANK() OVER(PARTITION BY AreaID ORDER BY salario DESC) AS Ranking
FROM emopleados

SELECT TOP 3 e.*, 
	a.nombre AS departamento,
	j.nombre AS Jefe,
	ROW_NUMBER() 
	OVER(ORDER BY salario DESC) AS Top3_salarios
FROM emopleados e
JOIN Area a
ON e.AreaID = a.AreaID
join Jefe j
ON e.JefeID = j.JefeID;

select * from emopleados