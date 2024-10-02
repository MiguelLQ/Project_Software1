-- Active: 1727798150388@@127.0.0.1@3306@r_user
-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2022 a las 21:14:13
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9
USE r_user;
CREATE DATABASE r_user;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `r_user`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--
USE DATABASE r_user;

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Lector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `correo`, `telefono`, `password`, `fecha`, `rol`) VALUES
(3, 'Maria', 'user@gmail.com', '9900258789', '12345', '2022-06-11 18:30:47', 2),
(4, 'Emanuel', 'usuario@gmail.com.mx', '9911165670', '12345', '2022-06-13 19:10:54', 1),
(7, 'Jose', 'jt615257@gmail.com', '9981298737', '12345', '2022-06-11 18:31:03', 2),
(10, 'Shaggy', 'Shaggy@Buu.net', '54948151', '12345', '2022-06-13 19:09:56', 1),
(11, 'Scrapy', 'sam@gmail.com', '9975201478', '12345', '2022-06-13 18:31:27', 2);

--
-- Índices para tablas volcadas
--


--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permisos` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `permisos` FOREIGN KEY (`rol`) REFERENCES `permisos` (`id`);
COMMIT;

SELECT * FROM user WHERE nombre='$nombre' AND password='$password';

CREATE TABLE Espacio
(
  Cod_esp INT NOT NULL,
  Estad_esp TINYINT(1) NOT NULL,  -- Usamos TINYINT(1) para simular BOOLEAN
  Ubi_esp VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cod_esp)
);

CREATE TABLE MetodPag
(
  cod_metd VARCHAR(4) NOT NULL,
  Descr_metd VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod_metd)
);

CREATE TABLE TipoVehic
(
  Cod_tipV VARCHAR(4) NOT NULL,
  Descr_tipV VARCHAR(100) NOT NULL,
  Cost_tipV DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Cod_tipV)
);


CREATE TABLE Vehículo
(
  Cod_V VARCHAR(4) NOT NULL,
  Marc_V VARCHAR(50) NOT NULL,
  Model_V VARCHAR(50) NOT NULL,
  Color_V VARCHAR(20) NOT NULL,
  Placa_V VARCHAR(12) NOT NULL,
  Cod_tipV VARCHAR(4) NOT NULL,
  PRIMARY KEY (Cod_V),
  FOREIGN KEY (Cod_tipV) REFERENCES TipoVehic(Cod_tipV)
);

CREATE TABLE Pago
(
  cod_Pag VARCHAR(4) NOT NULL,
  Mont_pag DECIMAL(10,2) NOT NULL,
  cod_metd VARCHAR(4) NOT NULL,
  PRIMARY KEY (cod_Pag),
  FOREIGN KEY (cod_metd) REFERENCES MetodPag(cod_metd)
);

CREATE TABLE Registro
(
  cod_reg VARCHAR(4) NOT NULL,
  Fecha_reg DATE NOT NULL,
  Hora_reg TIME NOT NULL,
  Durac_reg INT NOT NULL,
  Cod_V VARCHAR(4) NOT NULL,
  Cod_esp INT NOT NULL,
  cod_Pag VARCHAR(4) NOT NULL,
  PRIMARY KEY (cod_reg),
  FOREIGN KEY (Cod_V) REFERENCES Vehículo(Cod_V),
  FOREIGN KEY (Cod_esp) REFERENCES Espacio(Cod_esp),
  FOREIGN KEY (cod_Pag) REFERENCES Pago(cod_Pag)
);
CREATE TABLE Clientes (
    Cod_cliente INT NOT NULL AUTO_INCREMENT,
    Nom_cliente VARCHAR(50) NOT NULL,
    Apell_cliente VARCHAR(50) NOT NULL,
    Tel_cliente VARCHAR(10) NOT NULL,
    PRIMARY KEY (Cod_cliente)
);


-- Inserción de datos en la tabla Espacio
INSERT INTO Espacio (Cod_esp, Estad_esp, Ubi_esp) VALUES
(1, 1, 'Planta Baja - A1'),
(2, 0, 'Planta Baja - A2'),
(3, 1, 'Primer Piso - B1'),
(4, 0, 'Primer Piso - B2'),
(5, 1, 'Segundo Piso - C1'),
(6, 1, 'Segundo Piso - C2'),
(7, 0, 'Tercer Piso - D1'),
(8, 1, 'Tercer Piso - D2'),
(9, 0, 'Cuarto Piso - E1'),
(10, 1, 'Cuarto Piso - E2');

-- Inserción de datos en la tabla MetodPag
INSERT INTO MetodPag (cod_metd, Descr_metd) VALUES
('M001', 'Tarjeta de crédito'),
('M002', 'Tarjeta de débito'),
('M003', 'Efectivo'),
('M004', 'Transferencia bancaria'),
('M005', 'Pago móvil'),
('M006', 'Paypal'),
('M007', 'Criptomoneda'),
('M008', 'Cheque'),
('M009', 'Vales de empresa'),
('M010', 'Puntos de fidelidad');

-- Inserción de datos en la tabla TipoVehic
INSERT INTO TipoVehic (Cod_tipV, Descr_tipV, Cost_tipV) VALUES
('T001', 'Automóvil', 1500.00),
('T002', 'Motocicleta', 500.00),
('T003', 'Camión', 2500.00),
('T004', 'SUV', 1800.00),
('T005', 'Van', 2000.00),
('T006', 'Pickup', 2200.00),
('T007', 'Tractor', 3000.00),
('T008', 'Bicicleta', 100.00),
('T009', 'Autobús', 5000.00),
('T010', 'Carro eléctrico', 1700.00);


-- Inserción de datos en la tabla Vehículo
INSERT INTO Vehículo (Cod_V, Marc_V, Model_V, Color_V, Placa_V, Cod_tipV) VALUES
('V001', 'Toyota', 'Corolla', 'Rojo', 'ABC123', 'T001'),
('V002', 'Honda', 'Civic', 'Negro', 'DEF456', 'T001'),
('V003', 'BMW', 'X5', 'Blanco', 'GHI789', 'T004'),
('V004', 'Harley Davidson', 'Sportster', 'Azul', 'JKL012', 'T002'),
('V005', 'Ford', 'F-150', 'Gris', 'MNO345', 'T006'),
('V006', 'Chevrolet', 'Silverado', 'Verde', 'PQR678', 'T006'),
('V007', 'Tesla', 'Model 3', 'Negro', 'STU901', 'T010'),
('V008', 'Kawasaki', 'Ninja', 'Rojo', 'VWX234', 'T002'),
('V009', 'Mercedes-Benz', 'Sprinter', 'Blanco', 'YZA567', 'T005'),
('V010', 'Suzuki', 'Vitara', 'Plateado', 'BCD890', 'T004');

-- Inserción de datos en la tabla Pago
INSERT INTO Pago (cod_Pag, Mont_pag, cod_metd) VALUES
('P001', 150.00, 'M001'),
('P002', 50.00, 'M003'),
('P003', 200.00, 'M002'),
('P004', 500.00, 'M004'),
('P005', 300.00, 'M005'),
('P006', 1000.00, 'M006'),
('P007', 450.00, 'M007'),
('P008', 30.00, 'M008'),
('P009', 100.00, 'M009'),
('P010', 75.00, 'M010');

-- Inserción de datos en la tabla Registro
DELETE FROM Registro;  -- Elimina todos los registros existentes (opcional)
ALTER TABLE Registro MODIFY cod_reg VARCHAR(6);

INSERT INTO Registro (cod_reg, Fecha_reg, Hora_reg, Durac_reg, Cod_V, Cod_esp, cod_Pag, Cod_cliente) VALUES
('REG001', '2024-09-15', '10:00:00', 120, 'V001', 1, 'P001', 1),
('REG002', '2024-09-16', '11:00:00', 90, 'V002', 2, 'P002', 2),
('REG003', '2024-09-17', '12:30:00', 150, 'V003', 3, 'P003', 3),
('REG004', '2024-09-18', '09:15:00', 60, 'V001', 1, 'P004', 1),
('REG005', '2024-09-19', '14:45:00', 200, 'V002', 2, 'P005', 2),
('REG006', '2024-09-20', '08:30:00', 75, 'V003', 3, 'P006', 3),
('REG007', '2024-09-21', '10:15:00', 120, 'V001', 1, 'P007', 1),
('REG008', '2024-09-22', '13:00:00', 90, 'V002', 2, 'P008', 2),
('REG009', '2024-09-23', '11:45:00', 150, 'V003', 3, 'P009', 3),
('REG010', '2024-09-24', '15:30:00', 60, 'V001', 1, 'P010', 1);

INSERT INTO Clientes (Nom_cliente, Apell_cliente, Tel_cliente) VALUES
('Juan', 'Pérez', '9876543210'),
('María', 'González', '8765432109'),
('Carlos', 'Rodríguez', '7654321098'),
('Ana', 'Martínez', '6543210987'),
('Luis', 'Hernández', '5432109876'),
('Sofía', 'López', '4321098765'),
('David', 'García', '3210987654'),
('Isabel', 'Sánchez', '2109876543'),
('Fernando', 'Ramírez', '1098765432'),
('Patricia', 'Fernández', '0987654321');

-- 
SELECT * FROM Permisos;
--Consulta para obtener los usuarios que tienen un rol específico (ejemplo: Rol 1):

-- Consulta para obtener todos los espacios disponibles (es decir, con Estad_esp = 1):
SELECT * 
FROM Espacio
WHERE Estad_esp = 1;
-- Consulta para obtener la ubicación de un espacio específico (ejemplo: espacio con Cod_esp = 3):
SELECT Ubi_esp 
FROM Espacio
WHERE Cod_esp = 3;
-- Consulta para obtener todos los métodos de pago:
SELECT * FROM MetodPag;
-- Consulta para obtener las descripciones de métodos de pago que tienen más de 10 caracteres:
SELECT Descr_metd 
FROM MetodPag
WHERE LENGTH(Descr_metd) > 10;
-- Consulta para obtener todos los tipos de vehículos con su costo:
SELECT * FROM TipoVehic;
--Consulta para obtener el tipo de vehículo cuyo costo es mayor a 2000:
SELECT Descr_tipV, Cost_tipV 
FROM TipoVehic
WHERE Cost_tipV > 2000;
-- user
SELECT * FROM user;
-- Consulta para obtener todos los vehículos registrados:
SELECT * FROM Vehículo;
-- Consulta para obtener los vehículos de color rojo:
SELECT Marc_V, Model_V, Color_V 
FROM Vehículo
WHERE Color_V = 'Rojo';
-- onsulta para obtener todos los vehículos de la marca 'Toyota':
SELECT * 
FROM Vehículo
WHERE Marc_V = 'Toyota';
-- Consulta para obtener todos los pagos realizados:
SELECT * FROM Pago;
--Consulta para obtener pagos mayores a 100:
SELECT cod_Pag, Mont_pag 
FROM Pago
WHERE Mont_pag > 100;
-- Consulta para obtener todos los registros:
SELECT * FROM Registro;
-- Consulta para obtener registros realizados en una fecha específica (ejemplo: 2024-09-30):
SELECT * 
FROM Registro
WHERE Fecha_reg = '2024-09-30';
--Consulta para obtener el tiempo total de duración de todos los registros en un día determinado:
SELECT SUM(Durac_reg) AS TotalDuracion
FROM Registro
WHERE Fecha_reg = '2024-09-30';
-- Consulta para obtener los registros asociados a un vehículo específico (ejemplo: Cod_V = 'V001'):
SELECT * 
FROM Registro
WHERE Cod_V = 'V001';
-- Consulta SQL para obtener el monto de pago mediante la placa del vehículo:

SELECT P.Mont_pag, V.Placa_V 
FROM Registro R
JOIN Vehículo V ON R.Cod_V = V.Cod_V
JOIN Pago P ON R.cod_Pag = P.cod_Pag
WHERE V.Placa_V = 'ABC123';  -- Cambia 'ABC123' por la placa del vehículo que deseas consultar
-- Consulta SQL para generar una factura:
DESCRIBE Registro;
SELECT * FROM clientes;
SELECT * FROM registro;
ALTER TABLE Registro 
ADD Cod_cliente INT NOT NULL;

SELECT 
    C.Nom_cliente AS Nombre_Cliente,
    C.Apell_cliente AS Apellido_Cliente,
    C.Tel_cliente AS Telefono_Cliente,
    V.Marc_V AS Marca_Vehiculo,
    V.Model_V AS Modelo_Vehiculo,
    V.Placa_V AS Placa_Vehiculo,
    E.Ubi_esp AS Ubicacion_Espacio,
    R.Fecha_reg AS Fecha_Registro,
    R.Hora_reg AS Hora_Registro,
    R.Durac_reg AS Duracion_Registro,
    P.Mont_pag AS Monto_Pagado,
    MP.Descr_metd AS Metodo_Pago
FROM 
    Registro R
JOIN Vehículo V ON R.Cod_V = V.Cod_V
JOIN Clientes C ON R.Cod_cliente = C.Cod_cliente  -- Asegúrate de que esta columna existe
JOIN Espacio E ON R.Cod_esp = E.Cod_esp
JOIN Pago P ON R.cod_Pag = P.cod_Pag
JOIN MetodPag MP ON P.cod_metd = MP.cod_metd
WHERE V.Placa_V = 'ABC123';  -- Cambia 'ABC123' por la placa del vehículo que deseas facturar
-- verificar 
SELECT * FROM Registro WHERE Cod_V IN (SELECT Cod_V FROM Vehículo WHERE Placa_V = 'ABC123');
SELECT * FROM Vehículo WHERE Placa_V = 'ABC123';

SELECT 
    R.*, V.Placa_V
FROM 
    Registro R
JOIN Vehículo V ON R.Cod_V = V.Cod_V
WHERE V.Placa_V = 'ABC123';

SELECT 
    R.Fecha_reg,
    R.Hora_reg,
    V.Placa_V,
    V.Marc_V,
    V.Model_V,
    C.Nom_cliente,
    C.Apell_cliente
FROM 
    Registro R
JOIN Vehículo V ON R.Cod_V = V.Cod_V
JOIN Clientes C ON R.Cod_cliente = C.Cod_cliente  -- Asegúrate de que esta columna existe
WHERE V.Placa_V = 'ABC123';  -- Cambia 'ABC123' por la placa del vehículo
--onsulta que muestre los espacios ocupados
SELECT 
    E.Cod_esp AS Codigo_Espacio,
    E.Ubi_esp AS Ubicacion_Espacio,
    E.Estad_esp AS Estado_Espacio,
    C.Nom_cliente AS Nombre_Cliente,
    C.Apell_cliente AS Apellido_Cliente,
    V.Marc_V AS Marca_Vehiculo,
    V.Model_V AS Modelo_Vehiculo,
    V.Placa_V AS Placa_Vehiculo,
    R.Fecha_reg AS Fecha_Registro,
    R.Hora_reg AS Hora_Registro
FROM 
    Registro R
JOIN 
    Espacio E ON R.Cod_esp = E.Cod_esp
JOIN 
    Clientes C ON R.Cod_cliente = C.Cod_cliente
JOIN 
    Vehículo V ON R.Cod_V = V.Cod_V
WHERE 
    E.Estad_esp = TRUE  -- Solo muestra los espacios ocupados
    AND R.Fecha_reg = '2024-09-15';  -- Cambia esta fecha por la que desees

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


