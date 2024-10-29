/*
 Navicat Premium Dump SQL

 Source Server         : MySQL_localhost
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : tienda_virtual

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 23/10/2024 20:15:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente_id`) USING BTREE,
  UNIQUE INDEX `correo`(`correo` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Juan Pérez', 'nuevo.correo@example.com', '2024-10-22 07:24:52');
INSERT INTO `clientes` VALUES (2, 'Maria López', 'maria.lopez@example.com', '2024-10-22 07:24:52');

-- ----------------------------
-- Table structure for detalle_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE `detalle_pedidos`  (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NULL DEFAULT NULL,
  `producto_id` int NULL DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`detalle_id`) USING BTREE,
  INDEX `pedido_id`(`pedido_id` ASC) USING BTREE,
  INDEX `producto_id`(`producto_id` ASC) USING BTREE,
  CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedidos_chk_1` CHECK (`cantidad` > 0),
  CONSTRAINT `detalle_pedidos_chk_2` CHECK (`precio_unitario` > 0)
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detalle_pedidos
-- ----------------------------
INSERT INTO `detalle_pedidos` VALUES (1, 1, 1, 2, 1200.00);
INSERT INTO `detalle_pedidos` VALUES (2, 1, 2, 3, 25.50);

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NULL DEFAULT NULL,
  `fecha_pedido` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`pedido_id`) USING BTREE,
  INDEX `cliente_id`(`cliente_id` ASC) USING BTREE,
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedidos
-- ----------------------------
INSERT INTO `pedidos` VALUES (1, 1, '2024-10-22 00:00:00', NULL);

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `fecha_creacion` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Laptop', 'Electrónica', 1200.00, 15, '2024-10-22 07:24:22');
INSERT INTO `productos` VALUES (2, 'Mouse', 'Accesorios', 29.33, 50, '2024-10-22 07:24:22');
INSERT INTO `productos` VALUES (3, 'Teclado', 'Accesorios', 51.75, 50, '2024-10-22 07:24:22');
INSERT INTO `productos` VALUES (4, 'Impresora', 'Electrónica', 300.00, 10, '2024-10-22 07:24:22');
INSERT INTO `productos` VALUES (5, 'Monitor', 'Electrónica', 250.00, 20, '2024-10-22 07:24:22');

SET FOREIGN_KEY_CHECKS = 1;
