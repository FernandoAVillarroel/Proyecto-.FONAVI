-- Crear la base de datos
CREATE DATABASE liquidacion;

-- Usar la base de datos
USE liquidacion;

-- Crear tabla Usuario
CREATE TABLE Usuario (
    Id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Contraseña VARCHAR(50) NOT NULL,
    Tipo VARCHAR(20) NOT NULL
);

-- Crear tabla Oficina
CREATE TABLE Oficina (
    Id_oficina INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    Orden INT AUTO_INCREMENT PRIMARY KEY,
    Apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(50) UNIQUE NOT NULL,
    CUIL VARCHAR(50) UNIQUE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Situacion CHAR(1) NOT NULL,
    Numero_cuenta INT NOT NULL,
    Oficina INT NOT NULL,  -- Relación con Oficina
    Id_usuario INT NOT NULL,   -- Relación con Usuario
    FOREIGN KEY (Oficina) REFERENCES Oficina(Id_oficina),
    FOREIGN KEY (Id_usuario) REFERENCES Usuario(Id_usuario)
);

-- Crear tabla Titulos
CREATE TABLE Titulos (
    Nombre VARCHAR(50) PRIMARY KEY,  
    Porcentaje DECIMAL(10, 2) NOT NULL          
);

-- Crear tabla Categorias
CREATE TABLE Categorias (
    Nombre VARCHAR(50) PRIMARY KEY,  
    Basico DECIMAL(10, 2) NOT NULL,
    Supl1 DECIMAL(10, 2),
    Supl2 DECIMAL(10, 2),
    Supl3 DECIMAL(10, 2),
    Supl4 DECIMAL(10, 2),
    Supl6 DECIMAL(10, 2),
    Supl8 DECIMAL(10, 2),
    Supl12 DECIMAL(10, 2)
);

-- Crear tabla Detalles
CREATE TABLE Detalles (
    Id_detalles INT AUTO_INCREMENT PRIMARY KEY,
    Calificacion INT CHECK (Calificacion BETWEEN 1 AND 100),
    Fecha_ingreso DATE,
    Antiguedad INT,
    Funcion VARCHAR(50),  -- Relación con Categorias
    Orden INT,  -- Relación con Empleado
    Titulo VARCHAR(50), -- Relacion con Titulos
    FOREIGN KEY (Funcion) REFERENCES Categorias(Nombre),
    FOREIGN KEY (Orden) REFERENCES Empleado(Orden),
    FOREIGN KEY (Titulo) REFERENCES Titulos(Nombre)
);

-- Inserción de datos de la tabla Usuario
INSERT INTO Usuario (Nombre, Contraseña, Tipo) VALUES
    ('Usuario1', 'Contraseña1', 'Admin'),
    ('Usuario2', 'Contraseña2', 'Empleado'),
    ('Usuario3', 'Contraseña3', 'Admin'),
    ('Usuario4', 'Contraseña4', 'Empleado'),
    ('Usuario5', 'Contraseña5', 'Admin'),
    ('Usuario6', 'Contraseña6', 'Empleado'),
    ('Usuario7', 'Contraseña7', 'Admin'),
    ('Usuario8', 'Contraseña8', 'Empleado'),
    ('Usuario9', 'Contraseña9', 'Admin'),
    ('Usuario10', 'Contraseña10', 'Empleado'),
    ('Usuario11', 'Contraseña11', 'Admin'),
    ('Usuario12', 'Contraseña12', 'Empleado'),
    ('Usuario13', 'Contraseña13', 'Admin'),
    ('Usuario14', 'Contraseña14', 'Empleado'),
    ('Usuario15', 'Contraseña15', 'Admin'),
    ('Usuario16', 'Contraseña16', 'Empleado'),
    ('Usuario17', 'Contraseña17', 'Admin'),
    ('Usuario18', 'Contraseña18', 'Empleado'),
    ('Usuario19', 'Contraseña19', 'Admin'),
    ('Usuario20', 'Contraseña20', 'Empleado'),
    ('Usuario21', 'Contraseña21', 'Admin'),
    ('Usuario22', 'Contraseña22', 'Empleado'),
    ('Usuario23', 'Contraseña23', 'Admin'),
    ('Usuario24', 'Contraseña24', 'Empleado'),
    ('Usuario25', 'Contraseña25', 'Admin'),
    ('Usuario26', 'Contraseña26', 'Empleado'),
    ('Usuario27', 'Contraseña27', 'Admin'),
    ('Usuario28', 'Contraseña28', 'Empleado'),
    ('Usuario29', 'Contraseña29', 'Admin'),
    ('Usuario30', 'Contraseña30', 'Empleado'),
    ('Usuario31', 'Contraseña31', 'Admin'),
    ('Usuario32', 'Contraseña32', 'Empleado'),
    ('Usuario33', 'Contraseña33', 'Admin'),
    ('Usuario34', 'Contraseña34', 'Empleado'),
    ('Usuario35', 'Contraseña35', 'Admin'),
    ('Usuario36', 'Contraseña36', 'Empleado'),
    ('Usuario37', 'Contraseña37', 'Admin'),
    ('Usuario38', 'Contraseña38', 'Empleado'),
    ('Usuario39', 'Contraseña39', 'Admin'),
    ('Usuario40', 'Contraseña40', 'Empleado'),
    ('Usuario41', 'Contraseña41', 'Admin'),
    ('Usuario42', 'Contraseña42', 'Empleado'),
    ('Usuario43', 'Contraseña43', 'Admin'),
    ('Usuario44', 'Contraseña44', 'Empleado'),
    ('Usuario45', 'Contraseña45', 'Admin'),
    ('Usuario46', 'Contraseña46', 'Empleado'),
    ('Usuario47', 'Contraseña47', 'Admin'),
    ('Usuario48', 'Contraseña48', 'Empleado'),
    ('Usuario49', 'Contraseña49', 'Admin'),
    ('Usuario50', 'Contraseña50', 'Empleado');

-- Inserción de datos en la tabla Titulos
INSERT INTO Titulos (Nombre, Porcentaje) VALUES
    ('Universitario', 50),
    ('Tecnicatura', 35),
    ('Terciario', 30),
    ('Secundario', 27.5);

-- Inserción de datos en la tabla Oficina
INSERT INTO Oficina (Nombre) VALUES
    ('PRESIDENCIA IPVU'),
    ('SECRETARIA TECNICA IPVU'),
    ('SECRETARIA TECNICA DE CONSTRUCCCIONES'),
    ('SEC.TEC. DE ARQUITECTURA Y TECNOLOGIA'),
    ('SEC.TEC. DE PLANEAMIENTO Y DESARROLLO'),
    ('SEC.TEC. CONTABLE-FINANCIERA'),
    ('SECRETARIA TECNICA SOCIALES'),
    ('SECRETARIA TECNICA DE INFRESTRUCTURA'),
    ('SEC.TEC. DE RELAC. PUBLICAS INSTITUCIONALES'),
    ('SEC.TEC. DE DESPACHO Y ADMINISTRACION'),
    ('UNIDAD OPERATIVA PERSONAL'),
    ('SECRETARIA TECNICA PLANES DE EMERGENCIA'),
    ('SEC.TEC. DE CONTROL DE GEST. Y PLANIF. FINANCIERA'),
    ('MAESTRANZA'),
    ('SEC.TEC. DE REGULARIZACION Y RECUPERO HABITACIONAL'),
    ('UNIDAD OPERATIVA AUTOMOTORES'),
    ('SEC.TEC. DE COORDINACION GENERAL');

-- Inserción de datos en la tabla Categorias
INSERT INTO Categorias (Nombre, Basico, Supl1, Supl2, Supl3, Supl4, Supl6, Supl8, Supl12) VALUES
    ('PRESIDENCIA', 37321.86, 15, 75, 60, 3885.11, NULL, NULL, 40239.76),
    ('SECRETARIO TEC. IPVU', 37321.86, 15, 75, 60, 3885.11, NULL, NULL, 30179.85),
    ('SECRETARIOS TECNICOS', 37321.86, 15, 75, 60, 2331.03, NULL, NULL, 20119.88),
    ('JEFES UNIDAD', 30984.14, 15, 65, 50, NULL, 829.78, NULL, 20119.88),
    ('PROFESIONAL (SOLO)', 30984.14, NULL, 30, 20, NULL, 788.34, NULL, 20119.88),
    ('ASESOR LEGAL', 30984.14, NULL, 60, 40, NULL, 788.34, NULL, 20119.88),
    ('JEFE DE DPTO', 27087.97, NULL, 60, 40, NULL, 699.23, NULL, 20119.88),
    ('COORD. E INPECTOR DE OBRA', 27087.97, NULL, 60, 40, NULL, 829.78, NULL, 20119.88),
    ('JEFE DE DIVISION- ASISTENTE SOCIAL', 27087.97, NULL, 50, 30, NULL, 829.78, NULL, 20119.88),
    ('SOBRESTANTE TECNICO', 27087, NULL, 50, 30, NULL, 788.34, NULL, 20119.88),
    ('JEFE DE SECCION', 27087, NULL, 40, 25, NULL, 829.78, NULL, 20119.88),
    ('ADMINISTRATIVO', 27087.97, NULL, 30, 20, NULL, 788.34, NULL, 20119.88),
    ('AUXILIAR ADM', 23942.44, NULL, 20, 15, NULL, 788.34, 40, 20119.88),
    ('SERENO', 23942.44, NULL, 20, 15, NULL, 788.34, NULL, 20119.88),
    ('CHOFER', 23942.44, NULL, 20, 15, 1615.65, 78834, NULL, 20119.88),
    ('CAPATAZ DE OBRA', 23942.44, NULL, 20, 15, NULL, 788.34, 20119.88, 20119.88),
    ('ORDENANZA', 23942.44, NULL, 10, 10, 727.36, 788.34, NULL, 20119.88);

-- Inserción de datos en la tabla Empleado
INSERT INTO Empleado (Apellido, DNI, CUIL, Nombre, Situacion, Numero_cuenta, Oficina, Id_usuario) VALUES
    ('Perez', '12345678', '20012345678', 'Juan', 'P', 1000001, 1, 1),
    ('Gomez', '23456789', '20223456789', 'Ana', 'C', 1000002, 2, 2),
    ('Lopez', '34567890', '20334567890', 'Carlos', 'P', 1000003, 3, 3),
    ('Martinez', '45678901', '20445678901', 'Laura', 'C', 1000004, 4, 4),
    ('Hernandez', '56789012', '20556789012', 'Pedro', 'P', 1000005, 5, 5),
    ('Rodriguez', '67890123', '20667890123', 'Sofia', 'C', 1000006, 6, 6),
    ('Diaz', '78901234', '20778901234', 'Miguel', 'P', 1000007, 7, 7),
    ('Martinez', '89012345', '20889012345', 'Beatriz', 'C', 1000008, 8, 8),
    ('Sanchez', '90123456', '20990123456', 'Ricardo', 'P', 1000009, 9, 9),
    ('Mendez', '11223344', '20111223344', 'Patricia', 'C', 1000010, 10, 10),
    ('Ruiz', '22334455', '20222334455', 'Luis', 'P', 1000011, 11, 11),
    ('Rojas', '33445566', '20333445566', 'Daniela', 'C', 1000012, 12, 12),
    ('Morales', '44556677', '20444556677', 'Fernando', 'P', 1000013, 13, 13),
    ('Flores', '55667788', '20555667788', 'Juliana', 'C', 1000014, 14, 14),
    ('Jimenez', '66778899', '20666778899', 'Mario', 'P', 1000015, 15, 15),
    ('Garcia', '77889900', '20777889900', 'Natalia', 'C', 1000016, 16, 16),
    ('Castro', '88990011', '20888990011', 'Eduardo', 'P', 1000017, 17, 17),
    ('Silva', '99001122', '20999001122', 'Rosa', 'C', 1000018, 1, 18),
    ('Vazquez', '10022333', '20110022333', 'Santiago', 'P', 1000019, 2, 19),
    ('Paredes', '11133444', '20211133444', 'Carla', 'C', 1000020, 3, 20),
    ('Mora', '12244555', '20312244555', 'Eduardo', 'P', 1000021, 4, 21),
    ('Rivera', '13355666', '20413355666', 'Adriana', 'C', 1000022, 5, 22),
    ('Serrano', '14466777', '20514466777', 'Fernando', 'P', 1000023, 6, 23),
    ('Nunez', '15577888', '20615577888', 'Sofia', 'C', 1000024, 7, 24),
    ('Vega', '16688999', '20716688999', 'Julian', 'P', 1000025, 8, 25),
    ('Martinez', '17799000', '20817799000', 'Joaquín', 'C', 1000026, 9, 26),
    ('Torres', '18800111', '20918800111', 'Valeria', 'P', 1000027, 10, 27),
    ('Serrano', '19911222', '20119911222', 'Oscar', 'C', 1000028, 11, 28),
    ('Castillo', '20022333', '20220022333', 'Ruben', 'P', 1000029, 12, 29),
    ('Romero', '21133444', '20321133444', 'Alfredo', 'C', 1000030, 13, 30),
    ('Soto', '22244555', '20422244555', 'Lucia', 'P', 1000031, 14, 31),
    ('Bravo', '23355666', '20523355666', 'Lina', 'C', 1000032, 15, 32),
    ('Diaz', '24466777', '20624466777', 'Carlos', 'P', 1000033, 16, 33),
    ('Sosa', '25577888', '20725577888', 'Gustavo', 'C', 1000034, 17, 34),
    ('Morales', '26688999', '20826688999', 'Diego', 'P', 1000035, 1, 35),
    ('Carrillo', '27799000', '20927799000', 'Marta', 'C', 1000036, 2, 36),
    ('Luna', '28800111', '20128800111', 'Beatriz', 'P', 1000037, 3, 37),
    ('Villarreal', '29911222', '20229911222', 'Patricia', 'C', 1000038, 4, 38),
    ('Pinto', '30022333', '20330022333', 'Oscar', 'P', 1000039, 5, 39),
    ('Palma', '31133444', '20431133444', 'Alfredo', 'C', 1000040, 6, 40),
    ('Moreno', '32244555', '20532244555', 'Belen', 'P', 1000041, 7, 41),
    ('Ruiz', '33355666', '20633355666', 'Felipe', 'C', 1000042, 8, 42),
    ('Jimenez', '34466777', '20734466777', 'Nicolas', 'P', 1000043, 9, 43),
    ('Mora', '35577888', '20835577888', 'Patricia', 'C', 1000044, 10, 44),
    ('Alvarez', '36688999', '20936688999', 'Carlos', 'P', 1000045, 11, 45),
    ('Gonzalez', '37799000', '20137799000', 'Margarita', 'C', 1000046, 12, 46),
    ('Fernandez', '38800111', '20238800111', 'Victor', 'P', 1000047, 13, 47),
    ('Cortes', '39911222', '20339911222', 'Luis', 'C', 1000048, 14, 48),
    ('Ramirez', '40022333', '20440022333', 'Maria', 'P', 1000049, 15, 49),
    ('Jimenez', '41133444', '20541133444', 'Antonio', 'C', 1000050, 16, 50);


-- Inserción de datos en la tabla Detalles
INSERT INTO Detalles (Calificacion, Fecha_ingreso, Antiguedad, Funcion, Orden, Titulo) VALUES
    (90, '2010-06-15', 14, 'PRESIDENCIA', 1, 'Universitario'),
    (85, '2015-03-21', 9, 'SECRETARIO TEC. IPVU', 2, 'Tecnicatura'),
    (75, '2012-08-10', 12, 'SECRETARIOS TECNICOS', 3, 'Terciario'),
    (92, '2017-01-25', 7, 'JEFES UNIDAD', 4, 'Secundario'),
    (88, '2014-11-13', 10, 'PROFESIONAL (SOLO)', 5, 'Universitario'),
    (78, '2016-07-30', 8, 'ASESOR LEGAL', 6, 'Secundario'),
    (80, '2013-02-05', 11, 'JEFE DE DPTO', 7, 'Tecnicatura'),
    (70, '2019-05-18', 5, 'COORD. E INPECTOR DE OBRA', 8, 'Terciario'),
    (95, '2010-09-17', 14, 'JEFE DE DIVISION- ASISTENTE SOCIAL', 9, 'Universitario'),
    (65, '2021-02-25', 3, 'SOBRESTANTE TECNICO', 10, 'Secundario'),
    (90, '2012-03-30', 12, 'JEFE DE SECCION', 11, 'Tecnicatura'),
    (85, '2015-07-12', 9, 'ADMINISTRATIVO', 12, 'Terciario'),
    (80, '2018-10-22', 6, 'AUXILIAR ADM', 13, 'Secundario'),
    (75, '2020-01-14', 4, 'SERENO', 14, 'Secundario'),
    (70, '2019-06-02', 5, 'CHOFER', 15, 'Terciario'),
    (85, '2011-05-21', 13, 'CAPATAZ DE OBRA', 16, 'Tecnicatura'),
    (78, '2020-09-15', 4, 'ORDENANZA', 17, 'Secundario'),
    (88, '2016-12-05', 8, 'PRESIDENCIA', 18, 'Universitario'),
    (82, '2014-03-10', 10, 'SECRETARIO TEC. IPVU', 19, 'Secundario'),
    (75, '2012-11-07', 12, 'SECRETARIOS TECNICOS', 20, 'Terciario'),
    (70, '2018-05-19', 6, 'JEFES UNIDAD', 21, 'Secundario'),
    (90, '2017-04-10', 7, 'PROFESIONAL (SOLO)', 22, 'Tecnicatura'),
    (85, '2013-08-22', 11, 'ASESOR LEGAL', 23, 'Secundario'),
    (95, '2019-01-15', 5, 'JEFE DE DPTO', 24, 'Universitario'),
    (65, '2021-03-05', 3, 'COORD. E INPECTOR DE OBRA', 25, 'Terciario'),
    (87, '2012-04-30', 12, 'JEFE DE DIVISION- ASISTENTE SOCIAL', 26, 'Secundario'),
    (75, '2014-06-18', 10, 'SOBRESTANTE TECNICO', 27, 'Terciario'),
    (80, '2018-02-11', 6, 'JEFE DE SECCION', 28, 'Tecnicatura'),
    (89, '2020-07-25', 4, 'ADMINISTRATIVO', 29, 'Secundario'),
    (70, '2013-09-21', 11, 'AUXILIAR ADM', 30, 'Secundario'),
    (85, '2021-01-18', 3, 'SERENO', 31, 'Terciario'),
    (76, '2017-05-04', 8, 'CHOFER', 32, 'Tecnicatura'),
    (88, '2014-10-10', 10, 'CAPATAZ DE OBRA', 33, 'Universitario'),
    (91, '2016-03-15', 9, 'ORDENANZA', 34, 'Secundario'),
    (77, '2012-07-01', 12, 'PRESIDENCIA', 35, 'Secundario'),
    (92, '2019-04-05', 5, 'SECRETARIO TEC. IPVU', 36, 'Tecnicatura'),
    (81, '2018-11-10', 6, 'SECRETARIOS TECNICOS', 37, 'Secundario'),
    (69, '2013-02-12', 11, 'JEFES UNIDAD', 38, 'Terciario'),
    (93, '2017-08-09', 7, 'PROFESIONAL (SOLO)', 39, 'Universitario'),
    (80, '2020-11-11', 4, 'ASESOR LEGAL', 40, 'Secundario'),
    (82, '2015-12-19', 9, 'JEFE DE DPTO', 41, 'Tecnicatura'),
    (78, '2021-06-03', 3, 'COORD. E INPECTOR DE OBRA', 42, 'Terciario'),
    (84, '2014-08-25', 10, 'JEFE DE DIVISION- ASISTENTE SOCIAL', 43, 'Secundario'),
    (87, '2019-03-22', 5, 'SOBRESTANTE TECNICO', 44, 'Secundario'),
    (76, '2016-02-20', 8, 'JEFE DE SECCION', 45, 'Terciario'),
    (79, '2021-05-17', 4, 'ADMINISTRATIVO', 46, 'Secundario'),
    (85, '2013-04-25', 12, 'AUXILIAR ADM', 47, 'Tecnicatura'),
    (80, '2012-09-18', 12, 'SERENO', 48, 'Secundario'),
    (74, '2017-11-30', 6, 'CHOFER', 49, 'Terciario'),
    (90, '2018-01-12', 7, 'CAPATAZ DE OBRA', 50, 'Secundario');