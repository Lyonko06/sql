CREATE SCHEMA IF NOT EXISTS BD_Proveedores;
USE BD_Proveedores;

DROP TABLE IF EXISTS Proveedores;
CREATE TABLE Proveedores (
  id_proveedor          VARCHAR(3) NOT NULL,
  nombre               VARCHAR(50) NOT NULL,
  apellido             VARCHAR(50) NOT NULL,
  razon_social         VARCHAR(100) NOT NULL,
  cedula_identidad     VARCHAR(20),
  cedula_juridica      VARCHAR(20),
  domicilio           VARCHAR(100),
  ciudad              VARCHAR(50),
  provincia           VARCHAR(50),
  pais               VARCHAR(50),
  codigo_postal       VARCHAR(10),
  email              VARCHAR(100),
  telefono           VARCHAR(20),
  fax                VARCHAR(20),
  tipo_proveedor     ENUM('Fabricante', 'Distribuidor', 'Representante') NOT NULL,
  comentarios        VARCHAR(255),
  CONSTRAINT proveedores_pk PRIMARY KEY (id_proveedor)
);

DROP TABLE IF EXISTS Concesion_Credito;
CREATE TABLE Concesion_Credito (
  id_credito       VARCHAR(3) NOT NULL,
  id_proveedor     VARCHAR(3) NOT NULL,
  plazo_credito    ENUM('8 días', '15 días', '30 días', 'Otro') NOT NULL,
  otro_plazo       VARCHAR(50),
  CONSTRAINT concesion_credito_pk PRIMARY KEY (id_credito),
  CONSTRAINT concesion_credito_proveedor_fk FOREIGN KEY (id_proveedor) 
  REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Productos_Servicios;
CREATE TABLE Productos_Servicios (
  id_producto      VARCHAR(3) NOT NULL,
  id_proveedor     VARCHAR(3) NOT NULL,
  descripcion      VARCHAR(255) NOT NULL,
  CONSTRAINT productos_pk PRIMARY KEY (id_producto),
  CONSTRAINT productos_proveedor_fk FOREIGN KEY (id_proveedor) 
  REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE
);

INSERT INTO Proveedores VALUES 
('101', 'Carlos', 'Gómez', 'Tech Solutions S.A.', '12345678', 'J-12345678-9','Av. Principal 123', 'Nuevo Chimbote', 'Áncash', 'Perú', '02710','contacto@techsolutions.com', '987654321', '043-123456', 'Fabricante', NULL),
('102', 'Lucía', 'Fernández', 'Distribuidora Global S.A.C.', '87654321', 'J-98765432-1', 'Calle Secundaria 456', 'Chimbote', 'Áncash', 'Perú', '02711','ventas@distribuidoraglobal.com', '912345678', NULL, 'Distribuidor', NULL);

INSERT INTO Concesion_Credito VALUES 
('201', '101', '30 días', NULL),
('202', '102', 'Otro', '45 días');

INSERT INTO Productos_Servicios VALUES 
('301', '101', 'Servidores de alto rendimiento para data centers'),
('302', '101', 'Licencias de software empresarial');
COMMIT;