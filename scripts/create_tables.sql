-- Usar el esquema dw
SET search_path TO dw;

-- Crear tablas de dimensiones

-- Dimensión Producto
CREATE TABLE Dim_Producto (
    ID_Producto SERIAL PRIMARY KEY,
    Nombre_Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Material VARCHAR(50),
    Color VARCHAR(30),
    Dimensiones VARCHAR(50),
    Precio_Base DECIMAL(10, 2)
);

-- Dimensión Fecha
CREATE TABLE Dim_Fecha (
    ID_Fecha SERIAL PRIMARY KEY,
    Fecha DATE,
    Año INT,
    Mes INT,
    Dia INT,
    Trimestre INT
);

-- Dimensión Tienda
CREATE TABLE Dim_Tienda (
    ID_Tienda SERIAL PRIMARY KEY,
    Nombre_Tienda VARCHAR(100),
    Ubicacion VARCHAR(100),
    Tamaño DECIMAL(10, 2)
);

-- Dimensión Cliente
CREATE TABLE Dim_Cliente (
    ID_Cliente SERIAL PRIMARY KEY,
    Nombre_Cliente VARCHAR(100),
    Segmento VARCHAR(50),
    Direccion VARCHAR(150),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Dimensión Fabricante
CREATE TABLE Dim_Fabricante (
    ID_Fabricante SERIAL PRIMARY KEY,
    Nombre_Fabricante VARCHAR(100),
    Ubicacion VARCHAR(100),
    Capacidad_Produccion INT
);

-- Dimensión Proveedor
CREATE TABLE Dim_Proveedor (
    ID_Proveedor SERIAL PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100),
    Ubicacion VARCHAR(100),
    Materiales_Suministrados VARCHAR(100)
);

-- Crear tablas de hechos

-- Hechos de Ventas
CREATE TABLE Hechos_Ventas (
    ID_Venta SERIAL PRIMARY KEY,
    ID_Producto INT REFERENCES Dim_Producto(ID_Producto),
    ID_Tienda INT REFERENCES Dim_Tienda(ID_Tienda),
    ID_Cliente INT REFERENCES Dim_Cliente(ID_Cliente),
    ID_Fecha INT REFERENCES Dim_Fecha(ID_Fecha),
    Cantidad_Vendida INT,
    Precio_Unitario DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    Total_Venta AS (Cantidad_Vendida * Precio_Unitario - Descuento) STORED
);

-- Hechos de Producción
CREATE TABLE Hechos_Produccion (
    ID_Produccion SERIAL PRIMARY KEY,
    ID_Producto INT REFERENCES Dim_Producto(ID_Producto),
    ID_Fabricante INT REFERENCES Dim_Fabricante(ID_Fabricante),
    ID_Proveedor INT REFERENCES Dim_Proveedor(ID_Proveedor),
    ID_Fecha INT REFERENCES Dim_Fecha(ID_Fecha),
    Cantidad_Producida INT,
    Costo_Produccion DECIMAL(10, 2),
    Tiempo_Produccion DECIMAL(5, 2)
);
