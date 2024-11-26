use administracion;
DROP TABLE IF EXISTS peliculas, socios, alquileres;
CREATE TABLE peliculas (
    codigo SMALLINT UNSIGNED AUTO_INCREMENT,
    titulo VARCHAR(40) NOT NULL,
    actores VARCHAR(40),
    duracion TINYINT UNSIGNED,
    PRIMARY KEY (codigo)
);

CREATE TABLE socios (
    codigo SMALLINT UNSIGNED AUTO_INCREMENT,
    documento CHAR(8),
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    PRIMARY KEY (codigo)
);

CREATE TABLE alquileres (
    codigopelicula SMALLINT UNSIGNED NOT NULL,
    codigosocio SMALLINT UNSIGNED NOT NULL,
    fechaprestamo DATE NOT NULL,
    fechadevolucion DATE,
    PRIMARY KEY (codigopelicula, fechaprestamo)
);

insert into peliculas (titulo,actores,duracion)
  values('Elsa y Fred','China Zorrilla',90);
 insert into peliculas (titulo,actores,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actores,duracion)
  values('Mision imposible 2','Tom Cruise',180);
 insert into peliculas (titulo,actores,duracion)
  values('Harry Potter y la piedra filosofal','Daniel H.',120);
 insert into peliculas (titulo,actores,duracion)
  values('Harry Potter y la camara secreta','Daniel H.',150);
  
   insert into socios (documento,nombre)
  values('22333444','Juan Lopez');
 insert into socios (documento,nombre)
  values('23333444','Diana Perez');
 insert into socios (documento,nombre)
  values('24333444','Luis Fuentes');
  
   insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(1,1,'2016-07-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(2,1,'2016-07-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(3,1,'2016-07-12');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(1,2,'2016-08-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(3,2,'2016-08-12');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(4,2,'2016-08-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(1,3,'2016-09-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(2,3,'2016-08-02');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(3,3,'2016-08-15');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(4,3,'2016-08-22');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(4,1,'2016-08-25');
 insert into alquileres (codigopelicula,codigosocio,fechaprestamo)
  values(1,3,'2016-08-25');
  
select titulo,nombre,fechaprestamo,fechadevolucion from alquileres as a
  join peliculas as p
  on a.codigopelicula=p.codigo
  join socios as s
  on s.codigo=a.codigosocio;
  
   select p.titulo,count(*) from peliculas as p
  join alquileres as a
  on p.codigo=a.codigopelicula
  group by p.titulo;
  
   select s.nombre,count(a.codigopelicula) from socios as s
  join alquileres as a
  on s.codigo=a.codigosocio
  group by s.nombre;
  
  select s.nombre,count(distinct a.codigopelicula) from socios as s
  join alquileres as a
  on s.codigo=a.codigosocio
  group by s.nombre;
  
  select s.nombre,
  monthname(a.fechaprestamo) as mes,
  count(a.codigopelicula)
  from socios as s
  join alquileres as a
  on s.codigo=a.codigosocio
  group by s.nombre, mes
  order by mes;
  
  
  
-- ejercisio 2

DROP TABLE IF EXISTS socios, deportes, inscriptos;
 create table socios(
  documento char(8) not null,
  nombre varchar(30) not null,
  primary key(documento)
 );
 create table deportes(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null,
  codigodeporte tinyint unsigned,
  año year not null,
  cuota char(1), /*'s' o 'n', si esta paga o no*/
  primary key(documento,codigodeporte,año)
 );
 
 insert into socios values('22333444','Juan Perez');
 insert into socios values('23333444','Ana Garcia');
 insert into socios values('24333444','Hector Fuentes');
 insert into socios values('25333444','Marta Molina');
 
 insert into deportes (nombre) values('tenis');
 insert into deportes (nombre) values('natacion');
 insert into deportes (nombre) values('basquet');
 insert into deportes (nombre) values('voley');
 
 insert into inscriptos values('22333444',1,'2015','s');
 insert into inscriptos values('22333444',1,'2016','s');
 insert into inscriptos values('22333444',2,'2015','s');
 insert into inscriptos values('24333444',1,'2015','s');
 insert into inscriptos values('24333444',2,'2016','s');
 insert into inscriptos values('25333444',1,'2015','s');
 insert into inscriptos values('25333444',1,'2016','s');
 insert into inscriptos values('25333444',3,'2016','s');
 
 select s.nombre,d.nombre,i.año
  from inscriptos as i
  join socios as s
  on s.documento=i.documento
  join deportes as d
  on d.codigo=i.codigodeporte;
  
  select s.nombre,d.nombre
  from socios as s
  left join inscriptos as i
  on s.documento=i.documento
  left join deportes as d
  on d.codigo=i.codigodeporte;
  
 select d.nombre,count(i.codigodeporte)
  from deportes as d
  left join inscriptos as i
  on d.codigo=i.codigodeporte
  left join socios as s
  on s.documento=i.documento
  group by d.nombre;
  
  select distinct s.nombre
  from inscriptos as i
  join socios as s
  on s.documento=i.documento
  where año='2016';
  
-- ejercisio 3  
drop table if exists carreras, materias, inscriptos;

 create table carreras(
  codigo tinyint unsigned auto_increment,
  nombre varchar(30),
  primary key(codigo)
 );
 create table materias(
  codigo tinyint unsigned auto_increment,
  codigocarrera tinyint unsigned,
  nombre varchar(30),
  profesor varchar(30),
  primary key(codigo,codigocarrera)
 );
 create table inscriptos(
  documento char(8) not null,
  codigocarrera tinyint unsigned,
  codigomateria tinyint unsigned,
  año year,
  cuota char(1),/* si esta paga o no*/
  primary key (documento,codigocarrera,codigomateria,año)
 );
 
 insert into carreras values(1,'Analista de sistemas');
 insert into carreras values(2,'Diseñador web');
 
 insert into materias values(1,1,'Programacion I','Alfredo Lopez');
 insert into materias values(2,1,'Sistemas de datos I','Bernardo Garcia');
 insert into materias values(3,1,'Ingles tecnico','Edit Torres');
 insert into materias values(1,2,'Programacion basica','Alfredo Lopez');
 insert into materias values(2,2,'Ingles I','Edit Torres');
 insert into materias values(3,2,'Protocolos','Hector Juarez');
 
 insert into inscriptos values('22333444',1,1,'2015','s');
 insert into inscriptos values('22333444',1,2,'2015','s');
 insert into inscriptos values('22333444',1,3,'2016','n');
 insert into inscriptos values('23222222',1,1,'2015','s');
 insert into inscriptos values('23222222',1,2,'2016','s');
 insert into inscriptos values('24555666',1,1,'2015','s');
 insert into inscriptos values('24555666',2,1,'2015','s');
 insert into inscriptos values('25000999',1,1,'2015','s');
 insert into inscriptos values('25000999',1,2,'2015','s');
 insert into inscriptos values('25000999',2,1,'2016','n');
 insert into inscriptos values('25000999',2,2,'2016','s');
 
 select c.nombre, m.nombre,m.profesor
  from materias as m
  join carreras as c
  on c.codigo=m.codigocarrera
  order by c.nombre;
  
select i.documento,c.nombre,m.nombre,año,cuota
  from inscriptos as i
  join carreras as c
  on c.codigo=i.codigocarrera 
  join materias as m
  on m.codigo=i.codigomateria and
  m.codigocarrera=c.codigo
  order by c.nombre,c.nombre;
  
select m.profesor,count(*)
  from inscriptos as i
  join carreras as c
  on c.codigo=i.codigocarrera 
  join materias as m
  on m.codigo=i.codigomateria and
  m.codigocarrera=c.codigo
  group by m.profesor;
 select c.nombre,m.nombre,count(i.codigomateria)
  from carreras as c
  join materias as m
  on c.codigo=m.codigocarrera
  left join inscriptos as i
  on m.codigo=i.codigomateria and
  c.codigo=i.codigocarrera
  group by c.nombre,m.nombre;
  
 select i.documento,c.nombre,
  count(i.codigomateria) as materias
  from carreras as c
  join materias as m
  on c.codigo=m.codigocarrera
  join inscriptos as i
  on m.codigo=i.codigomateria and
  c.codigo=i.codigocarrera
  group by i.documento,c.nombre;
  
 select count(distinct documento) from inscriptos;
 
  select c.nombre,m.nombre,count(*)
  from inscriptos as i
  join carreras as c
  on c.codigo=i.codigocarrera 
  join materias as m
  on m.codigo=i.codigomateria and
  m.codigocarrera=c.codigo
  where i.cuota='n'
  group by c.nombre,m.nombre;


