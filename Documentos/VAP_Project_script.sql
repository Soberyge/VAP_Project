CREATE DATABASE VAP_Project
USE VAP_Project

-- -----------------------------------------------------
-- Table administrador
-- -----------------------------------------------------
CREATE TABLE administrador (
  id_administrador INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  txt_correo_admin VARCHAR(45) NOT NULL,
  txt_contraseña_admin VARBINARY(MAX) NOT NULL);

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  txt_nombre_cliente VARCHAR(20) NOT NULL,
  txt_apellidos_cliente VARCHAR(40) NOT NULL,
  int_celular_cliente BIGINT NOT NULL,
  txt_correo_cliente VARCHAR(45) NOT NULL,
  txt_contraseña_cliente VARBINARY(MAX) NOT NULL);

-- -----------------------------------------------------
-- Table producto
-- -----------------------------------------------------
CREATE TABLE producto (
  id_prenda INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  txt_tipo_prenda VARCHAR(8) CHECK(txt_tipo_prenda IN('playera', 'sudadera')) NOT NULL,
  txt_concepto_prenda VARCHAR(45) NOT NULL,
  txt_marca_prenda VARCHAR(20) NOT NULL,
  dec_precio_prenda DECIMAL(6,2) NOT NULL,
  img_blanco_prenda IMAGE NOT NULL,
  img_negro_prenda IMAGE NOT NULL,
  txt_estado_prenda VARCHAR(13) CHECK(txt_estado_prenda IN('vigente', 'descontinuado')) NOT NULL DEFAULT 'vigente');

-- -----------------------------------------------------
-- Table variantes_producto
-- -----------------------------------------------------
CREATE TABLE variantes_producto (
  txt_id_variane VARCHAR(6) PRIMARY KEY NOT NULL,
  txt_color_prenda VARCHAR(6) CHECK(txt_color_prenda IN('negro', 'blanco')) NOT NULL,
  txt_talla_prenda VARCHAR(2) CHECK(txt_talla_prenda IN('CH', 'M', 'G', 'EG')) NOT NULL,
  int_cantidad_prenda INT NOT NULL,
  id_prenda INT NOT NULL,
  CONSTRAINT fk_variante_prenda FOREIGN KEY (id_prenda) REFERENCES producto (id_prenda));

-- -----------------------------------------------------
-- Table pedido
-- -----------------------------------------------------
CREATE TABLE pedido (
  id_pedido INT PRIMARY KEY NOT NULL IDENTITY(1,1),
  d_fecha_pedido DATE NOT NULL,
  dec_total_pedido DECIMAL(8,2) NOT NULL,
  txt_estado_pedido VARCHAR(9) CHECK(txt_estado_pedido IN('pendiente', 'empacado', 'enviado', 'entregado', 'cancelado')) NOT NULL DEFAULT 'pendiente',
  id_cliente INT NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente));

-- -----------------------------------------------------
-- Table producto_seleccionado
-- -----------------------------------------------------
CREATE TABLE producto_seleccionado (
  int_cantidad_subpedido INT NOT NULL,
  txt_id_variante VARCHAR(6) NOT NULL,
  id_pedido INT NOT NULL,
  CONSTRAINT fk_producto_pedido FOREIGN KEY (txt_id_variante) REFERENCES variantes_producto (txt_id_variane),
  CONSTRAINT fk_pedido_completo FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido));

-- -----------------------------------------------------
-- Table venta
-- -----------------------------------------------------
CREATE TABLE venta (
  id_venta INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  id_pedido INT NOT NULL,
  CONSTRAINT fk_venta_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido));