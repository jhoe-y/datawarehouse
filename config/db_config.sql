-- Configuración de la base de datos
CREATE DATABASE data_warehouse_muebles;

-- Conectar a la base de datos
\c data_warehouse_muebles;

-- Crear esquema para el data warehouse
CREATE SCHEMA IF NOT EXISTS dw;
