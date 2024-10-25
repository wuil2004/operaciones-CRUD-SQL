# Operaciones CRUD de MYSQL
las *CRUD* son un conjunto de 4 operaciones fundamentales en el manejo de bases de datos y plicaciones 
web CRUD es un acronimo que representa las siguientes operaciones
- **C**reate (create)
- **R**read (leer)
- **U**pdate (actualizar)
- **D**elete (eleminar)

**Primero creamos una tabla.**
```sql
CREATE TABLE Usuarios(
    id_usuario int PRIMARY KEY AUTO_INCEMENT,
    email varchar(100) UNIQUE NOT NULL CHECK(email LIKE "%_@_%._%")
    contraseña VARCHAR(15) NOT NULL  CHECK(LENGTH(contraseña) >=8)
);
```
la operacion **create** es responsable de insertar nuevos datos en la base de datos en lenguaje sql esto se realiza con 
la sentencia y en el casi de MYSQL el proposito de la operacion es añadir el nuevo registro a una tabla 

```sql
-- ejemplo de una insercion validad ud'sando todos los campos 
INSERT INTO Usuarios VALUES(1, "ejemplo@mail.com","12345678");
-- ejemplo de una insersion validad utilizando el comando default
INSERT INTO Usuarios VALUES(DEFAULT, "ejemplo2@gmail.com","abcdefgh");
-- ejemplo de una insercion sin incluir el id usuario
INSERT Usuarios(email,contraseña ) VALUES("email3@hotmail.com", "12345678");
```
### ejercisios
identifica los tipos de roles que pueden salir en esta tabla 
inserta cuatro registros nuevos en un solo insert 

*R*ead 
la operacion **leer** es utilizada consultar o para recuperar datos esto no modifica los datos simplemente los extrae. En MYSQK esta 
operacion se realiza con la sectencia ```SELECT```
```sql
--ejemplo de una consulta de los datos de una tabla 
SELECT * FROM Usuarios;
--ejemplo de consulta de un registro en espesifico atraves del id
SELECT * FROM Usuarios WHERE id_usuario=1;--condicion
-- ejemplo de consulta para un registro con un email espesifico
SELECT * FROM Usuarios WHERE email="ejemplo@gmail.com";
--ejemplo de consulta con solo los campos de email y password
SELECT email, pasword FROM Usuarios;
-- ejemplo de consulta con un condicional logico 
SELECT * FROM Usuarios WHERE LENGtH(password)>=9;
```
### ejercisio
realiza una consulta que muestre solamente el email pero que consida con una contraseña de mas de 8 caracteres y otras que realice una 
consulta a los id pares

# UPDATE
la operacipon *actualizar* se utiliza para modificar registros exixtentes en la base de datos. esto se hace con la segtencia ```update```
```sql
--ejemplo para actualizar la contraseña por su id
UPDATE Usuarios SET password = "a1b2c3d4e5" WHERE  id_usuario=1 ;--restriccion/condiccion
--ejemplo para actualizar el email y password en un usuario en espesifico 
UPDATE Usuario SET password ="a1b2c3d45" email="ejemplo455@gmail.com" WHERE id_usuario= 1;
```
### ejercisio 
intenta actualizar registros con valores que violen las restricciones minimo 3

## DELETE 
la operacion *eleminar* se usa para borrar registros de la base de datos. esto se realiza con segtencia ```delete```
*debemos ser muy cuidadosos con esta operacion ya que una ves que los datos son eliminados ya no pueden ser recuperados*
 ```sql
 --elimiar el usuario por el id
DELETE FROM Usuarios WHERE id_usuarios=4;
--eliminar los usuario con email espesifico 
DELETE FROM Usuarios WHERE email="luciohdz3042@gmail.com";
 ```
### ejercicios
* eleminar usuarios email contengan uno o mas cinco
* elimar usuarios que tengan una contraseña que contenga letras  mayusculas usando expresiones regulares 
* eliminar usuarios con contraseñas que contengan solo numeros 
* eliminar usuarios con correos que no tengan el dominio gmail
