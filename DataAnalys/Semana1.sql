CREATE DATABASE EjemploDB;
use EjemploDB;

CREATE TABLE emopleados(
id int primary key,
nombre varchar(50),
salario int
);

alter table emopleados add area varchar(50);

Update emopleados set edad = 26 where id=7;

update emopleados
set area = 'Recursos Humanos'
where id = 13;

INSERT INTO emopleados VALUES(14, 'Lalo',35000, 36);

update emopleados
set area = case id
	when 6 then 'Diseño Grafico'
	when 7 then 'Soporte Tecnico'
	when 8 then 'Administracion'
	when 9 then 'Tecnologia'
	when 10 then 'Administracion'
	when 11 then 'Administracion'
	when 12 then 'Tecnologia'
	when 13 then 'Recursos Humanos'
	when 14 then 'Marketing'
end
where id in (6,7,8,9,10,11,12,123,14);

select * from emopleados

select * from emopleados where salario >=13000
select * from emopleados where edad >24

select * from emopleados where nombre = 'Aldo';

select * from emopleados where salario <> 15000;

--------------------------------------------------------
 select * from emopleados
 where salario >= 15000 and edad > 25;

 select * from emopleados
 where nombre = 'Aldo' or nombre ='Estrella';

 select * from emopleados
 where salario > 15000 and edad < 30 or id = 1;

 --LIKE 
 SELECT * FROM emopleados
 where nombre LIKE '%na%';


 select nombre, salario, edad from emopleados
 where salario > 15000 and edad > 30;

 select * from emopleados
 where nombre like 'm%' and salario > 1000;

 -------------------ORDER BY-------------------------

 SELECT * FROM emopleados
 ORDER BY salario ASC;

 SELECT * FROM emopleados
 ORDER BY salario DESC;

 SELECT * FROM emopleados
 ORDER BY nombre ASC;

 SELECT * FROM emopleados
 ORDER BY salario DESC, edad ASC;

 SELECT * FROM emopleados
 WHERE salario >= 15000 
 ORDER BY salario DESC;

 select * from emopleados
 ORDER BY edad DESC;

 SELECT * FROM emopleados
 WHERE salario <= 15000
 ORDER BY salario DESC;

 Select * from emopleados
 where nombre like 'a%' or nombre like  '%a'
 ORDER BY nombre DESC;

 ------------------- TOP -------------------------

 SELECT TOP 3 * 
 FROM emopleados
 ORDER BY salario ASC;

 SELECT TOP 2 nombre, salario
 FROM emopleados
 ORDER BY salario DESC;

 SELECT TOP 2 * 
 FROM emopleados 
 WHERE salario > 15000
 ORDER BY salario DESC;

 SELECT TOP 3 *
 FROM emopleados
 Order by edad ASC;

 SELECT TOP 1 *
 FROM emopleados
 Order by salario ASC;

 SELECT TOP 2 * 
 FROM emopleados
 ORDER BY edad DESC;

 SELECT TOP 4 * 
 FROM emopleados
 WHERE salario >= 15000 
 ORDER BY salario DESC;