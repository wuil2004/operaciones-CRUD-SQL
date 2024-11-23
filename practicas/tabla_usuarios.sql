show databases;
create database administracion;
show databases;
use administracion;
show tables;
create table usuarios(
nombre varchar(30),
clave varchar(10)
);
show tables;

drop table usuarios;
show tables;

drop table if exists usuarios;
show tables;

describe usuarios;

insert into usuarios (nombre, clave) values ("Mario Perez", "marte");

select nombre, clave from usuarios;




-- pronlema 4
drop table if exists agenda;

create table agenda(
nombre varchar(20),
domicilio varchar(30),
telefono varbinary(11)
);

show tables;
describe agenda;
insert into agenda (nombre, domicilio, telefono) values ("Alberto Mores", "colon123", "'4234567");
insert into agenda (nombre, domicilio, telefono) values  ('Juan Torres','Avellaneda 135','4458787');

select nombre, domicilio, telefono from agenda;


drop table if exists libros;
create table libros(
titulo varchar(20),
autor  varchar(30),
editorial varbinary(15)
);




use administracion;

drop table if exists empleados;

create table empleados(
nombre varchar (20),
documento varchar (20),
sexo varchar (10),
domicilio varchar (30),
sueldobasico int
);

insert into empleados (nombre, documento, sexo, domicilio, 
sueldobasico) value ('Juan Perez','22345678','m',
'Sarmiento 123',300);

insert into empleados (nombre, documento, sexo, domicilio, 
sueldobasico) value ('Ana Acosta','24345678','f',
'Colon 134',500);

insert into empleados (nombre, documento, sexo, domicilio, 
sueldobasico) value  ('Marcos Torres','27345678','m',
'Urquiza 479',800);

select nombre, documento, sexo, domicilio, sueldobasico 
from empleados;

select nombre, documento from empleados;

select nombre, documento, sueldobasico 
from empleados;

drop table if exists articulos;

create table articulos(
codigoDelArticulo int, 
nombreDelArticulo varchar (20),
drescripcion varchar (30),
precio float (10,2)

);

insert into codigoDelArticulo (codigoDelArticulo,nombreDelArticulo, 
descricion, precio) value  (1,'impresora','Epson Stylus C45',400.80);