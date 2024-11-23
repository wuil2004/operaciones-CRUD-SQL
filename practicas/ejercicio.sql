use administracion;

drop table if exists usuarios;

create table usuarios(
nombre varchar (30),
clave varchar (10)
);
drop table usuarios;
describe usuarios;

insert into usuarios(nombre, clave) values ('Leonardo', 'leo');
insert into usuarios(nombre, clave) values ('Mario Peres', 'Marito');
insert into usuarios(nombre, clave) values ('Marcelo', 'bocajunior');
insert into usuarios(nombre, clave) values ('Gustabo', 'bocajunior');

select nombre, clave from usuarios;
select nombre,clave from usuarios where nombre ="Leonardo";
select nombre,clave from usuarios where clave ="bocajunior";

-- clave primaria
create table usuarios(
nombre varchar (30),
clave varchar (30),
primary key(nombre)
);
insert into usuarios(nombre, clave) values ('Leonardo', 'Leo');
insert into usuarios(nombre, clave) values ('Mario Peres', 'Mar1');
insert into usuarios(nombre, clave) values ('Marcelo', 'Mar2');
insert into usuarios(nombre, clave) values ('Gustabo', 'Gus');



drop table if exists libros;

create table libros(
codigo int unsigned auto_increment,
titulo varchar (40) not null,
autor varchar (30),
editorial varchar (15),
precio decimal (5.2) unsigned,
cantidad smallint unsigned, -- tipo de dato  en este caso tipo de entero asignar el t`ipo de entero 
primary key (codigo)
);

insert into libros (codigo, titulo, autor, editorial, precio, cantidad) values 
	('el aleph', 'borges', 'Planeta', 15, 100),
	('Martin Fierro', 'Jose Hernandez', 'Emecel', 22.20, 200),
	('Antologia Poetica', 'Borges', 'planeta', 40, 150),
	('Aprenda PHP','Mario Molena', 'Emee', 18.20, 200),
	('Cervantes y el Quijote', 'Borges', 'Paidos', 36.40, 100),
	('Manual de PHP', 'J.C perez', 'Paidos', 30.80, 100),
	('Harry Potter y la pieda filosofal', 'J.K.Rowling', 'Paidos', 45.00, 500),
	('Harry Potter y la camara de los secretos', 'J.K.Rowling', ' Paidos', 46.00, 300),
	('Alicia en el palasio de las maravillas', 'Lewis Carroll', ' Paidos', null , 50);


INSERT INTO libros (titulo, autor, editorial, precio, cantidad) VALUES
    ('El Aleph', 'Borges', 'Planeta', 15.00, 100),
    ('Martin Fierro', 'Jose Hernandez', 'Emecel', 22.20, 200),
    ('Antologia Poetica', 'Borges', 'Planeta', 40.00, 150),
    ('Aprenda PHP', 'Mario Molena', 'Emee', 18.20, 200),
    ('Cervantes y el Quijote', 'Borges', 'Paidos', 36.40, 100),
    ('Manual de PHP', 'J.C. Perez', 'Paidos', 30.80, 100),
    ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Paidos', 45.00, 500),
    ('Harry Potter y la camara de los secretos', 'J.K. Rowling', 'Paidos', 46.00, 300),
    ('Alicia en el palacio de las maravillas', 'Lewis Carroll', 'Paidos', NULL, 50);

select titulo, precio, cantidad, precio * cantidad from libros;
select titulo,precio, precio* 0.1, precio-(precio*0.1)from libros;
select count(*) from libros;
select count(*) from libros where editorial = 'planeta';
select count(*) from libros where autor like '%Bor%';
select sum(cantidad) from libros;
select max(precio) from libros;
select min(precio) from libros where autor like '%Rowling%';
select avg(precio) from libros ;
select avg(precio) from libros where titulo like '%PHP%';



