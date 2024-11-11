-- Usar el esquema dw
SET search_path TO dw;

-- Consulta: Total de ventas por producto
SELECT p.Nombre_Producto, SUM(v.Total_Venta) AS Total_Ventas
FROM Hechos_Ventas v
JOIN Dim_Producto p ON v.ID_Producto = p.ID_Producto
GROUP BY p.Nombre_Producto;

-- Consulta: Cantidad producida y costo total por mes
SELECT f.Mes, p.Nombre_Producto, SUM(hp.Cantidad_Producida) AS Total_Producido, SUM(hp.Costo_Produccion) AS Costo_Total
FROM Hechos_Produccion hp
JOIN Dim_Producto p ON hp.ID_Producto = p.ID_Producto
JOIN Dim_Fecha f ON hp.ID_Fecha = f.ID_Fecha
GROUP BY f.Mes, p.Nombre_Producto;

-- Consulta: Análisis de ventas por tienda
SELECT t.Nombre_Tienda, SUM(v.Total_Venta) AS Total_Ventas
FROM Hechos_Ventas v
JOIN Dim_Tienda t ON v.ID_Tienda = t.ID_Tienda
GROUP BY t.Nombre_Tienda;
