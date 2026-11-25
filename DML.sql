
-- =========================================
-- 1. USUARIOS
-- =========================================

INSERT INTO users (username, email, password) VALUES
('admin', 'admin@inventario.com', '123456'),
('juan', 'juan@inventario.com', '123456'),
('maria', 'maria@inventario.com', '123456'),
('carlos', 'carlos@inventario.com', '123456'),
('ana', 'ana@inventario.com', '123456');

-- =========================================
-- 2. ROLES
-- =========================================

INSERT INTO roles (nombre, descripcion) VALUES
('Administrador', 'Acceso completo al sistema'),
('Vendedor', 'Gestion de ventas y clientes'),
('Almacenero', 'Gestion de productos e inventarios'),
('Comprador', 'Gestion de compras y proveedores');

-- =========================================
-- 3. PERMISOS
-- =========================================

INSERT INTO permissions (nombre, descripcion) VALUES
('usuarios.index', 'Listar usuarios'),
('usuarios.create', 'Crear usuarios'),
('usuarios.edit', 'Editar usuarios'),
('usuarios.delete', 'Eliminar usuarios'),
('productos.index', 'Listar productos'),
('productos.create', 'Registrar productos'),
('productos.edit', 'Editar productos'),
('productos.delete', 'Eliminar productos'),
('ventas.index', 'Listar ventas'),
('ventas.create', 'Registrar ventas'),
('compras.index', 'Listar compras'),
('compras.create', 'Registrar compras'),
('inventarios.index', 'Consultar inventarios'),
('inventarios.edit', 'Modificar inventarios'),
('reportes.index', 'Consultar reportes');

-- =========================================
-- 4. ROLE_USER
-- =========================================

INSERT INTO role_user (role_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(2, 5);

-- =========================================
-- 5. PERMISSION_ROLE
-- =========================================

-- Administrador: todos los permisos
INSERT INTO permission_role (role_id, permission_id)
SELECT 1, id FROM permissions;

-- Vendedor
INSERT INTO permission_role (role_id, permission_id) VALUES
(2, 5),
(2, 9),
(2, 10),
(2, 13);

-- Almacenero
INSERT INTO permission_role (role_id, permission_id) VALUES
(3, 5),
(3, 6),
(3, 7),
(3, 13),
(3, 14);

-- Comprador
INSERT INTO permission_role (role_id, permission_id) VALUES
(4, 5),
(4, 11),
(4, 12),
(4, 13);

-- =========================================
-- 6. CLIENTES Y PROVEEDORES
-- =========================================

INSERT INTO clienteproveedors
(nombre_completo, correo, razon_social, numero_identificacion, telefono, estado)
VALUES
('Roberto Perez', 'roberto@gmail.com', NULL, '1234567', '70123456', TRUE),
('Laura Fernandez', 'laura@gmail.com', NULL, '7654321', '70234567', TRUE),
('Comercial San Juan', 'ventas@sanjuan.com', 'Comercial San Juan SRL', '1020304050', '22123456', TRUE),
('Distribuidora Central', 'central@gmail.com', 'Distribuidora Central SA', '2030405060', '22234567', TRUE),
('Miguel Rojas', 'miguel@gmail.com', NULL, '4567890', '70345678', TRUE),
('Importadora del Sur', 'sur@gmail.com', 'Importadora del Sur SRL', '3040506070', '22345678', TRUE);

-- =========================================
-- 7. SUCURSALES
-- =========================================

INSERT INTO sucursales
(nombre, direccion, telefono, ciudad, estado)
VALUES
('Sucursal Central', 'Av. Mariscal Santa Cruz Nro. 100', '22111111', 'La Paz', TRUE),
('Sucursal Sur', 'Av. Montenegro Nro. 250', '22222222', 'La Paz', TRUE),
('Sucursal Cochabamba', 'Av. Heroínas Nro. 300', '42333333', 'Cochabamba', TRUE);

-- =========================================
-- 8. SUCURSAL_USER
-- =========================================

INSERT INTO sucursal_user (user_id, sucursal_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 2),
(5, 3);

-- =========================================
-- 9. ALMACENES
-- =========================================

INSERT INTO almacenes
(nombre, codigo, descripcion, sucursal_id)
VALUES
('Almacen Principal', 'ALM-001', 'Almacen general de productos', 1),
('Almacen Secundario', 'ALM-002', 'Almacen de productos de reserva', 1),
('Almacen Zona Sur', 'ALM-003', 'Almacen de la sucursal sur', 2),
('Almacen Cochabamba', 'ALM-004', 'Almacen de la sucursal Cochabamba', 3);

-- =========================================
-- 10. CATEGORIAS
-- =========================================

INSERT INTO categorias (nombre, descripcion) VALUES
('Electronica', 'Productos electronicos y tecnologicos'),
('Computacion', 'Equipos y accesorios de computacion'),
('Oficina', 'Materiales y utiles de oficina'),
('Hogar', 'Productos para el hogar'),
('Accesorios', 'Accesorios variados');

-- =========================================
-- 11. PRODUCTOS
-- =========================================

INSERT INTO productos
(codigo, nombre, descripcion, precio_venta_actual, imagen, estado, categoria_id)
VALUES
('PROD-001', 'Laptop Lenovo', 'Laptop Lenovo Core i5 8GB RAM', 4500.00, 'laptop.jpg', TRUE, 2),
('PROD-002', 'Mouse Logitech', 'Mouse optico USB', 85.00, 'mouse.jpg', TRUE, 2),
('PROD-003', 'Teclado USB', 'Teclado ergonomico USB', 120.00, 'teclado.jpg', TRUE, 2),
('PROD-004', 'Monitor Samsung', 'Monitor LED de 24 pulgadas', 1250.00, 'monitor.jpg', TRUE, 1),
('PROD-005', 'Impresora Epson', 'Impresora multifuncional', 1800.00, 'impresora.jpg', TRUE, 1),
('PROD-006', 'Papel bond', 'Resma de papel tamaño carta', 45.00, 'papel.jpg', TRUE, 3),
('PROD-007', 'Silla de oficina', 'Silla ergonomica ejecutiva', 650.00, 'silla.jpg', TRUE, 3),
('PROD-008', 'Memoria USB', 'Memoria USB de 64GB', 75.00, 'usb.jpg', TRUE, 5),
('PROD-009', 'Disco SSD', 'Disco solido de 512GB', 420.00, 'ssd.jpg', TRUE, 2),
('PROD-010', 'Parlante Bluetooth', 'Parlante portatil Bluetooth', 250.00, 'parlante.jpg', TRUE, 1);

-- =========================================
-- 12. INVENTARIOS
-- =========================================

INSERT INTO inventarios
(cantidad_actual, fecha_actualizacion, almacen_id, producto_id)
VALUES
(15, '2026-11-20', 1, 1),
(80, '2026-11-20', 1, 2),
(60, '2026-11-20', 1, 3),
(25, '2026-11-20', 1, 4),
(12, '2026-11-20', 1, 5),
(200, '2026-11-20', 1, 6),
(30, '2026-11-20', 1, 7),
(100, '2026-11-20', 1, 8),
(40, '2026-11-20', 1, 9),
(20, '2026-11-20', 1, 10),

(8, '2026-11-20', 2, 1),
(30, '2026-11-20', 2, 2),
(20, '2026-11-20', 2, 3),
(10, '2026-11-20', 2, 4),

(10, '2026-11-20', 3, 1),
(50, '2026-11-20', 3, 2),
(15, '2026-11-20', 3, 8),

(5, '2026-11-20', 4, 4),
(10, '2026-11-20', 4, 5),
(25, '2026-11-20', 4, 6);

-- =========================================
-- 13. NOTAS
-- =========================================

INSERT INTO notas
(fecha, tipo_nota, descuento_total, observaciones, clienteproveedor_id, user_id)
VALUES
('2026-11-20 09:30:00', 'COMPRA', 0.00, 'Compra inicial de productos', 3, 4),
('2026-11-20 11:00:00', 'COMPRA', 50.00, 'Compra de accesorios', 4, 4),
('2026-11-21 10:15:00', 'VENTA', 0.00, 'Venta de productos de computacion', 1, 2),
('2026-11-21 14:30:00', 'VENTA', 20.00, 'Venta de accesorios', 2, 5),
('2026-11-22 09:00:00', 'VENTA', 0.00, 'Venta de equipos electronicos', 5, 2),
('2026-11-22 16:00:00', 'COMPRA', 100.00, 'Reposicion de mercaderia', 6, 4);

-- =========================================
-- 14. MOVIMIENTOS
-- =========================================

INSERT INTO movimientos
(nota_id, producto_id, almacen_id, tipo_movimiento,
 precio_unitario_compra, precio_unitario_venta, observaciones)
VALUES

-- COMPRA 1
(1, 1, 1, 'ENTRADA', 3500.00, 4500.00, 'Ingreso de laptops'),
(1, 2, 1, 'ENTRADA', 50.00, 85.00, 'Ingreso de mouse'),
(1, 3, 1, 'ENTRADA', 75.00, 120.00, 'Ingreso de teclados'),

-- COMPRA 2
(2, 4, 1, 'ENTRADA', 950.00, 1250.00, 'Ingreso de monitores'),
(2, 5, 1, 'ENTRADA', 1400.00, 1800.00, 'Ingreso de impresoras'),

-- VENTA 1
(3, 1, 1, 'SALIDA', 3500.00, 4500.00, 'Venta de laptop'),
(3, 2, 1, 'SALIDA', 50.00, 85.00, 'Venta de mouse'),

-- VENTA 2
(4, 3, 1, 'SALIDA', 75.00, 120.00, 'Venta de teclado'),
(4, 8, 1, 'SALIDA', 40.00, 75.00, 'Venta de memoria USB'),

-- VENTA 3
(5, 4, 1, 'SALIDA', 950.00, 1250.00, 'Venta de monitor'),
(5, 5, 1, 'SALIDA', 1400.00, 1800.00, 'Venta de impresora'),

-- COMPRA 3
(6, 6, 1, 'ENTRADA', 30.00, 45.00, 'Ingreso de papel bond'),
(6, 9, 1, 'ENTRADA', 300.00, 420.00, 'Ingreso de discos SSD');

