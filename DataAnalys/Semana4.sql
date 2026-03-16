USE EjemploDB

SELECT * FROM emopleados 

CREATE TABLE Area (
AreaID int primary key,
nombre VARCHAR (50)
);

SELECT * FROM Area

Alter table emopleados
ADD CONSTRAINT fk_area
FOREIGN KEY (AreaID)
REFERENCES Area(AreaID);

ALTER TABLE emopleados
DROP COLUMN area



SELECT emopleados.nombre, Area.nombre
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID;

SELECT
emopleados.nombre,
emopleados.salario,
Area.nombre
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID

SELECT 
emopleados.nombre,
Area.nombre
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID
WHERE Area.nombre = 'IT';

SELECT 
Area.nombre,
AVG(emopleados.salario) AS Promedio
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID
GROUP BY Area.nombre;

SELECT 
Area.nombre,
MAX(emopleados.salario) AS Salario_Maximo
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID
GROUP BY Area.nombre

SELECT 
emopleados.nombre,
Area.nombre,
emopleados.salario
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID
ORDER BY emopleados.salario DESC;

SELECT Area.nombre,
COUNT(*) AS Num_Empleados
FROM emopleados
INNER JOIN Area
ON emopleados.AreaID = Area.AreaID
GROUP BY Area.nombre;

SELECT emopleados.nombre, Area.nombre
FROM emopleados
LEFT JOIN Area
ON emopleados.AreaID = Area.AreaID

SELECT emopleados.nombre,
emopleados.salario,
Area.nombre
FROM emopleados
LEFT JOIN Area
ON emopleados.AreaID = Area.AreaID

SELECT emopleados.nombre
FROM emopleados
LEFT JOIN Area
ON emopleados.AreaID = Area.AreaID
WHERE Area.AreaID IS NULL;

SELECT Area.nombre,
COUNT(emopleados.id) AS TotalEmpleados
FROM Area
LEFT JOIN emopleados
ON emopleados.AreaID = Area.AreaID
GROUP BY Area.nombre

SELECT Area.nombre,
AVG(emopleados.salario) AS Promedio
FROM Area
LEFT JOIN emopleados
ON emopleados.AreaID = Area.AreaID
GROUP BY Area.nombre

SELECT Area.nombre
From Area
LEFT JOIN emopleados
ON emopleados.AreaID = Area.AreaID
Where emopleados.AreaID IS NULL

---------------------RIGHT JOIN----------------------------------------

SELECT emopleados.nombre, Area.nombre
FROM emopleados
RIGHT JOIN Area
ON emopleados.AreaID = Area.AreaID;

SELECT emopleados.nombre, Area.nombre
FROM emopleados
FULL JOIN Area
ON emopleados.AreaID = Area.AreaID;

SELECT Area.nombre
FROM emopleados
RIGHT JOIN Area
ON emopleados.AreaID = Area.AreaID
WHERE emopleados.AreaID IS NULL;

SELECT * 
FROM emopleados
FULL JOIN Area
ON emopleados.AreaID = Area.AreaID;

SELECT Area.nombre,
	COUNT (emopleados.nombre) AS Num_Empleados
FROM Area
FULL JOIN emopleados
ON Area.AreaID = emopleados.AreaID
GROUP BY Area.nombre

SELECT emopleados.nombre,Area.nombre
FROM emopleados
FULL JOIN Area
ON emopleados.AreaID = Area.AreaID
ORDER  BY emopleados.nombre ASC

-----------------------SELF JOIN--------------------------------------------
ALTER TABLE emopleados
ADD CONSTRAINT fk_jefe
FOREIGN KEY (JefeID)
REFERENCES Jefe(JefeID);

ALTER TABLE emopleados
DROP CONSTRAINT fk_jefe;

SELECT * FROM emopleados 
SELECT * FROM Area
select * from Jefe

SELECT 
	e.nombre AS emopleado,
	j.nombre AS Jefe
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id;

SELECT 
	e.nombre AS empleado,
	j.nombre AS jefe
FROM emopleados e
INNER JOIN emopleados j
ON e.JefeID = j.id;

SELECT 
	e.nombre,
	j.nombre AS jefe
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id
ORDER BY jefe;

SELECT 
	e.nombre,
	j.nombre AS jefe
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id
WHERE j.nombre LIKE 'Aldo';

SELECT
	e.nombre,
	j.nombre AS Jefe
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id
WHERE j.nombre IS NOT NULL;

SELECT
	e.nombre,
	j.nombre AS Jefe
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id
WHERE j.nombre IS NULL;

	e.nombre,
	j.nombre AS Patron
FROM emopleados e
LEFT JOIN emopleados j
ON e.JefeID = j.id
ORDER BY j.nombre

