CREATE DATABASE techstore_sales;

-- 2) Tabla: Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

-- 3) Tabla: Sucursales
CREATE TABLE sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50)
);

-- 4) Tabla: Ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    fecha_venta DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_ventas_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_ventas_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal) ON DELETE CASCADE
);

-- 5) Tabla: Detalle_Ventas
CREATE TABLE detalle_ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT NOT NULL,
    sku_producto VARCHAR(50) NOT NULL,  -- Conexión lógica al sistema NoSQL (productos en MongoDB)
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_venta_momento DECIMAL(10,2) NOT NULL CHECK (precio_venta_momento >= 0),
    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE
);


