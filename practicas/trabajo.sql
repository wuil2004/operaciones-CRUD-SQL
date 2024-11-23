use administracion;
create table libro (
codigo int unsigned auto_increment,
titulo varchar(40) not null,
autor varchar(30) not null default 'desconocido',
codigoeditorial tinyint unsigned not null,
precio decimal(5,2) unsigned,
cantidad smallint unsigned default 0,
primary key (codigo) 
);

create table editorial(
codigo tinyint unsigned auto_increment,
nombre varchar (20) not null,
direccion varchar(30) not null,
primary key (codigo)
);

insert into libro (titulo, autor, codigoeditorial, precio, cantidad) values
('el Aleph','Borges',3,43.5,200),
('Alicia en el palasio de las maravillas', 'Lewis Carroll', 2, 33.5 , 100),
('Aprenda PHP','Mario Perez', 1, 55.8, 50),
('java en 10 minutos','Juan Lopez',1,88, 150),
('alicia a traves del expejo','lewis Carroll',1,15.5,80),
('servantes y el quijote','Borges-Bioy Casares',3,25.5,300);

insert into editorial(nombre, direccion) values
('Podos','colon 190'),
('Emece','Rivaderia 765'),
('Planeta','Gerardo Paz 245'),
('Sudamericana','9 de julio1008');

select * from libros;

select * from libro
join editorial
on libro.codigoeditorial = editorial.codigo; 

select * from libro join editorial;

select * from libro
join editorial
on codigoeditorial = codigo;

select * from libro as l
join editorial as e
on l.codigoeditorial = e.codigo;

  create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar (30),
  ciudad varchar (20),
  telefono varchar (20),
  montocompra decimal (6,2) unsigned
  ); 
  
insert into visitantes (nombre, edad, sexo, domicilio, ciudad, telefono, montocompra) values 
('susana molina',28, 'f', 'colon123','cordoba',null, 45 )
()

INSERT INTO visitantes 
(nombre, edad, sexo, domicilio, ciudad, telefono, montocompra)
VALUES
    ('Susana Molina', 28, 'f', 'Colon 123', 'Cordoba', NULL, 45.50),
    ('Marcela Mercado', 36, 'f', 'Avellaneda 345', 'Cordoba', '4545454', 0),
    ('Alberto Garcia', 35, 'm', 'Gral. Paz 123', 'Alta Gracia', '03547123456', 25),
    ('Teresa Garcia', 33, 'f', 'Gral. Paz 123', 'Alta Gracia', '03547123456', 0),
    ('Roberto Perez', 45, 'm', 'Urquiza 335', 'Cordoba', '4123456', 33.20),
    ('Marina Torres', 22, 'f', 'Colon 222', 'Villa Dolores', '03544112233', 25),
    ('Julieta Gomez', 24, 'f', 'San Martin 333', 'Alta Gracia', '03547121212', 53.50),
    ('Roxana Lopez', 20, 'f', 'Triunvirato 345', 'Alta Gracia', NULL, 0),
    ('Liliana Garcia', 50, 'f', 'Paso 999', 'Cordoba', '4588778', 48),
    ('Juan Torres', 43, 'm', 'Sarmiento 876', 'Cordoba', '4988778', 15.30);
        
    SELECT COUNT(*) FROM visitantes;
    
    SELECT SUM(montocompra) FROM visitantes WHERE ciudad = 'Alta Gracia';
    
    SELECT MAX(montocompra) FROM visitantes;
    
    select min(edad) from visitantes;
    
    SELECT AVG(edad) FROM visitantes;
    
    SELECT AVG(montocompra) FROM visitantes;

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  