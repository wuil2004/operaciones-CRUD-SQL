# Problemario de operaciones CRUD #2

## Creacion de la base de datos

```sql
CREATE DATABASE tienda_virtual;

USE tienda_virtual;

CREATE TABLE productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    fecha_registro DATE DEFAULT CURDATE()
);

CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE detalle_pedidos (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
);


```

## Ejercicios CREATE

1. **Inserta 5 productos diferentes en la tabla `productos`.**  
   
   *Instrucción:* Los productos deben incluir un nombre, categoría, precio y stock inicial.

2. **Registra 3 clientes en la tabla `clientes`.**  
   
   *Instrucción:* Ingresa datos de nombre y correo para cada cliente. Asegúrate de que los correos sean únicos.

3. **Inserta 2 pedidos hechos por diferentes clientes.**  
   
   *Instrucción:* Cada pedido debe tener al menos 2 productos, especifica la cantidad y el precio unitario de cada uno.

## Ejercicios READ

1. **Obtén una lista de todos los productos que tienen un stock mayor a 10 unidades.**  
   
   *Instrucción:* Muestra el `producto_id`, `nombre`, `precio` y `stock`.

2. **Encuentra los pedidos realizados por un cliente en particular.** 
   
   *Instrucción:* Muestra el `nombre` del cliente, `pedido_id`, `fecha_pedido` y el `total`.

3. **Muestra el total de ventas por cada producto.**  
   
   *Instrucción:* Agrupa por `producto_id` y muestra el `nombre` del producto y la cantidad total vendida en todos los pedidos.

## Ejercicios UPDATE

1. **Actualiza el precio de todos los productos de una categoria aumentando un 15%.**  
   
   *Instrucción:* Usa la columna `categoria` para filtrar los productos.

2. **Modifica el correo de uno de los clientes por un nuevo correo electrónico.**
   
   *Instrucción:* Asegúrate de que el nuevo correo sea único.

3. **Corrige el stock de un producto cuyo stock actual es incorrecto.** 
   *Instrucción:* Busca el producto por su `producto_id` y actualiza el campo `stock`.

## Ejercicos DELETE

1. **Elimina todos los productos de la tabla `productos` que no tienen stock disponible.** 
   
   *Instrucción:* Debes usar la columna `stock` para identificar productos con stock igual a 0.

2. **Borra un pedido que fue cancelado por el cliente.** 
   
   *Instrucción:* Elimina el pedido junto con todos los registros relacionados en la tabla `detalle_pedidos`.

3. **Elimina un cliente que ha solicitado la eliminación de su cuenta.**
   
   *Instrucción:* Asegúrate de borrar primero los registros relacionados en la tabla `pedidos` y luego el cliente de la tabla `clientes`.




