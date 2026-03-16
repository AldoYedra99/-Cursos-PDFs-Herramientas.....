USE EjemploDB
select * from emopleados

SELECT area, AVG(salario) AS Promedio
FROM emopleados
GROUP BY area;

SELECT area, SUM(salario) AS TOTAL
FROM emopleados
GROUP BY area;

SELECT area, COUNT(*) AS Total_Empleados
FROM emopleados
GROUP BY area;

SELECT area, MAX(salario) AS salario_Maximo
FROM emopleados
GROUP BY area;

select * from emopleados

SELECT area, AVG(salario) AS Promedio
FROM emopleados
WHERE salario > 15000
GROUP BY area;

SELECT area, MAX(salario)AS salario_MAXIMO, 
	MIN(salario)AS salario_MINIMO
	FROM emopleados
GROUP BY area;

SELECT area, AVG(salario)AS Promedio_Salario
FROM emopleados 
GROUP BY area
ORDER BY Promedio_Salario DESC;
------------------------ HAVING ------------------------

SELECT area, AVG(salario) AS Promedio
FROM emopleados
GROUP BY area
HAVING AVG(salario) > 15000;

SELECT area, SUM(salario) AS TOTAL
FROM emopleados
GROUP BY area
HAVING SUM(salario) > 25000;

SELECT area, COUNT(*) AS TOTAL
FROM emopleados
GROUP BY area
HAVING COUNT(*)>1;

SELECT area,MAX(salario) AS Salario_Maximo
FROM emopleados
GROUP BY area
HAVING MAX(salario) > 15000;

SELECT area, AVG(salario) AS Promedio
FROM emopleados
WHERE salario > 12000
GROUP BY area 
HAVING AVG(salario) > 15000;

SELECT area, AVG(salario) AS Promedio
FROM emopleados
GROUP BY area
HAVING AVG(salario) > 15000
ORDER BY Promedio DESC;

SELECT AreaID, MAX (salario)AS Salario_Maximo, MIN(salario)AS Salario_Minimo
FROM emopleados
GROUP BY AreaID
HAVING MAX(salario) > 15000;

select * from emopleados
UPDATE emopleados
SET ciudad = 'Neza'
Where id = 13;

SELECT area, AVG(salario) AS promedio
FROM emopleados
GROUP BY area;

SELECT area, ciudad, AVG(salario) AS Promedio
FROM emopleados
GROUP BY area, ciudad;

SELECT area, ciudad, COUNT(*) AS Total_Empleados
FROM emopleados
GROUP BY area, ciudad;

SELECT area, ciudad, SUM(salario) AS Total_Salarios
FROM emopleados
GROUP BY area, ciudad; 

SELECT area, ciudad, AVG(salario) AS promedio
FROM emopleados
GROUP BY area, ciudad
ORDER BY promedio DESC;

SELECT area, ciudad, MAX(salario) AS Salario_Maximo
FROM emopleados
GROUP BY area, ciudad;

SELECT area, ciudad, 
	MAX(salario) AS salario_Maximo, 
	MIN(salario) AS Salario_Minimo
FROM emopleados
GROUP BY area, ciudad;

SELECT area, ciudad, AVG(salario) AS promedio
FROM emopleados
GROUP BY area, ciudad
HAVING AVG(salario) > 15000

-------------------- SUBCONSULTAS ---------------------------

SELECT *
FROM emopleados
WHERE salario = (
	SELECT MAX(salario)
	FROM emopleados
);

SELECT nombre, salario
FROM emopleados 
WHERE salario > (
	SELECT AVG(salario)
	FROM emopleados
);

SELECT nombre, salario
FROM emopleados
WHERE salario < (
	SELECT AVG(salario)
	FROM emopleados
);

SELECT * 
FROM emopleados
WHERE salario = (
	SELECT MIN(salario)
	FROM emopleados
);

SELECT nombre, area
FROM emopleados
WHERE area IN (
	SELECT area 
	FROM emopleados
	WHERE salario > 15000
);

SELECT nombre, salario,
(SELECT AVG(salario) FROM emopleados) AS Promedio_Empresa
FROM emopleados

SELECT nombre, salario
FROM emopleados
	WHERE salario > (
	select AVG(salario) 
	FROM emopleados
);
SELECT AVG(salario)AS promedio_Empresa
FROM emopleados 

SELECT MAX(salario) AS Segundo_Salario
FROM emopleados
WHERE salario < (
	SELECT MAX(salario)
	FROM emopleados 
);

);

SELECT nombre, salario
FROM emopleados
WHERE salario = (
	SELECT MAX(salario)
	FROM emopleados
	WHERE salario < (
	SELECT MAX(salario)
	FROM emopleados)
);

