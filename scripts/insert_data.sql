-- Usar el esquema dw
SET search_path TO dw;

-- Insertar datos en dimensiones

-- Datos de ejemplo para Dim_Producto
INSERT INTO Dim_Producto (Nombre_Producto, Categoria, Material, Color, Dimensiones, Precio_Base)
VALUES 
('Silla', 'Asientos', 'Madera', 'Marrón', '50x50x100', 120.00),
('Mesa', 'Superficies', 'Metal', 'Negro', '150x90x75', 300.00);

-- Datos de ejemplo para Dim_Fecha
INSERT INTO Dim_Fecha (Fecha, Año, Mes, Dia, Trimestre)
VALUES 
('2024-01-15', 2024, 1, 15, 1),
('2024-02-20', 2024, 2, 20, 1);

-- Datos de ejemplo para Dim_Tienda
INSERT INTO Dim_Tienda (Nombre_Tienda, Ubicacion, Tamaño)
VALUES 
('Tienda Centro', 'Ciudad Central', 300.50),
('Tienda Norte', 'Ciudad Norte', 200.75);

-- Datos de ejemplo para Dim_Cliente
INSERT INTO Dim_Cliente (Nombre_Cliente, Segmento, Direccion, Telefono, Email)
VALUES 
('Juan Perez', 'Hogar', 'Calle 123', '123456789', 'juan@example.com'),
('Empresa ABC', 'Empresa', 'Avenida Principal', '987654321', 'contacto@abc.com');

-- Datos de ejemplo para Dim_Fabricante
INSERT INTO Dim_Fabricante (Nombre_Fabricante, Ubicacion, Capacidad_Produccion)
VALUES 
('MueblesFinos SA', 'Zona Industrial', 500);

-- Datos de ejemplo para Dim_Proveedor
INSERT INTO Dim_Proveedor (Nombre_Proveedor, Ubicacion, Materiales_Suministrados)
VALUES 
('Proveedora de Madera', 'Ciudad Bosque', 'Madera');

-- Insertar datos en tablas de hechos

-- Datos de ejemplo para Hechos_Ventas
INSERT INTO Hechos_Ventas (ID_Producto, ID_Tienda, ID_Cliente, ID_Fecha, Cantidad_Vendida, Precio_Unitario, Descuento)
VALUES 
(1, 1, 1, 1, 3, 120.00, 10.00),
(2, 2, 2, 2, 1, 300.00, 15.00);

-- Datos de ejemplo para Hechos_Produccion
INSERT INTO Hechos_Produccion (ID_Producto, ID_Fabricante, ID_Proveedor, ID_Fecha, Cantidad_Producida, Costo_Produccion, Tiempo_Produccion)
VALUES 
(1, 1, 1, 1, 200, 1000.00, 12.5),
(2, 1, 1, 2, 150, 750.00, 10.0);
