CREATE DATABASE BD_G1_EXAMEN1_CUESTIONARIO;

USE BD_G1_EXAMEN1_CUESTIONARIO;



CREATE TABLE tb_cliente(

  idCliente INT(11) AUTO_INCREMENT PRIMARY KEY,

  idc_cliente INT(8) zerofill UNIQUE NOT NULL,

  nombreCliente VARCHAR(100) UNIQUE NOT NULL,

  emailCliente VARCHAR(100),

  estadoCliente CHAR(1) NOT NULL

);



CREATE TABLE tb_modulo(

idModulo INT(11) AUTO_INCREMENT PRIMARY KEY,

  numeroModulo INT(11) NOT NULL,

  nombreModulo VARCHAR(100) NOT NULL,

  estadoModulo CHAR(1) NOT NULL

);



CREATE TABLE tb_tipocuestionario(

idTipoCuestionario INT(11) AUTO_INCREMENT PRIMARY KEY,

  nombreTipoCuestionario VARCHAR(100) NOT NULL,

  estadoTipoCuestionario CHAR(1) NOT NULL

);



CREATE TABLE tb_evaluacion(

idEvaluacion INT(11) AUTO_INCREMENT PRIMARY KEY,

  idModulo INT(11) NOT NULL,

  idCliente INT(11) NOT NULL,

  estadoEvaluacion CHAR(1) NOT NULL,

  FOREIGN KEY (idCliente) REFERENCES tb_cliente(idCliente),

FOREIGN KEY (idModulo) REFERENCES tb_modulo(idModulo)

);



CREATE TABLE tb_cuestionario(

idCuestionario INT(11) AUTO_INCREMENT PRIMARY KEY,

  ordenPregunta INT(11) NOT NULL,

  tituloCuestionario VARCHAR(500) NOT NULL,

  idTipoCuestionario INT(11) NOT NULL,

  idModulo INT(11) NOT NULL,

  estadoCuestionario CHAR(1) NOT NULL,

  FOREIGN KEY (idTipoCuestionario) REFERENCES tb_tipocuestionario(idTipoCuestionario),

FOREIGN KEY (idModulo) REFERENCES tb_modulo(idModulo)

);



CREATE TABLE tb_respuesta(

idRespuesta INT(11) AUTO_INCREMENT PRIMARY KEY,

  idEvaluacion INT(11) NOT NULL,

  idCuestionario INT(11) NOT NULL,

  respuestaEvaluacion VARCHAR(500) NOT NULL, 

fechaRespuesta datetime NOT NULL,

  FOREIGN KEY (idEvaluacion) REFERENCES tb_evaluacion(idEvaluacion),

  FOREIGN KEY (idCuestionario) REFERENCES tb_cuestionario(idCuestionario)

);



-- 1. Realizar el registro de los tipos de cuestionarios. 



INSERT INTO tb_tipocuestionario(nombreTipoCuestionario, estadoTipoCuestionario) 

VALUES

('Cuestionario Cliente', 'A'),

('Cuestionario Proveedor Operación', 'A'),

('Cuestionario Proveedor Construcción', 'A'),

('Cuestionario Proveedor Construcción y Operación','A');



SELECT * FROM tb_tipocuestionario;



-- 2. Realizar el registro de los siguientes Módulos. 

INSERT INTO tb_modulo(numeroModulo, nombreModulo, estadoModulo) 

VALUES

('1', 'IDENTIFICACIÓN DEL PROYECTO/EMPRESA SOLICITANTE ', 'A'),

('2','CARACTERIZACIÓN DE LOS SITIOS DEL PROYECTO', 'A'),

('3','MÓDULO: CARACTERIZACIÓN DE LAS ÁREAS DE INFLUENCIA', 'A'),

('4','ACCIONES IMPACTANTES DE LAS ACTIVIDADES DEL PROYECTO', 'A'),

('5','MÓDULO: GESTÓN SOCIO-AMBIENTAL', 'A'),

('1','IDENTIFICACIÓN DEL PROVEEDOR', 'A'),

('2', 'CARACTERIZACIÓN DE LOS SITIOS DEL PROVEEDOR', 'A'),

('3', 'ACCIONES IMPACTANTES DE LAS ACTIVIDADES DEL PROVEEDOR', 'A'),

('4', 'GESTÓN SOCIO-AMBIENTAL PROVEEDOR', 'A');



SELECT * FROM tb_modulo;



-- 3  Realizar el registro de un mínimo de 15 Clientes. 

-- Personas Naturales

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000001, 'Juan Pérez', 'juan@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000002, 'María García', 'maria@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000003, 'Carlos López', 'carlos@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000004, 'Ana Rodríguez', 'ana@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000005, 'Pedro Martínez', 'pedro@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000006, 'Sofía Fernández', 'sofia@example.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000007, 'Luisa Gómez', '', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000008, 'Javier Sánchez', '', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000009, 'Elena Díaz', '', 'A');



-- Personas Jurídicas

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000010, 'Empresa XYZ S.A.', '', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000011, 'Compañía ABC S.A.', '', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000012, 'Corporación QRS', 'ventas@corporacion-qrs.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000013, 'Asociación de Profesionales', 'info@profesionales-asoc.com', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000014, 'Fundación XYZ', 'contacto@fundacion-xyz.org', 'A');

INSERT INTO tb_cliente (idc_cliente, nombreCliente, emailCliente, estadoCliente) VALUES (00000015, 'SENATI INSTITUTO', 'contacto@fundacion-xyz.org', 'A');



SELECT * FROM tb_cliente;



-- 4. Realizar el registro de las preguntas en la tabla cuestionario, según el Excel. 



INSERT INTO tb_cuestionario(ordenPregunta, tituloCuestionario, idTipoCuestionario, idModulo, estadoCuestionario)

VALUES 

(1, 'Razon Social', 2, 7, 'A'),

(2, 'RUC', 2, 7, 'A'),

(3, 'Dirección', 2, 7, 'A'),

(4, 'Persona Contacto', 2, 7, 'A'),

(5, 'Email Persona Contacto', 2, 7, 'A'),

(6, 'Celular Persona Contacto', 2, 7, 'A'),

(7, 'Valor y tipo de préstamo solicitado', 2, 7, 'A'),

(8, 'Valor total de la inversión (US$)', 2, 7, 'A'),

(9, 'Comentarios', 2, 7, 'A'),

(10, 'Extensión Terreno (km)', 2, 2, 'A'),

(11, 'Generación propia de energía (SI/NO)', 2, 2, 'A'),

(12, 'Extensión de Vegetación natural (km)', 2, 2, 'A'),

(13, 'Extensión de Área Construida (km)', 2, 2, 'A'),

(14, 'Áreas naturales protegidas', 2, 2, 'A'),

(15, 'Cantidad de mano de obra local', 2, 4, 'A'),

(16, 'Cantidad de mano de obra extra local', 2, 4, 'A'),

(17, 'Consumo de energía (kWh/año)', 2, 4, 'A'),

(18, 'Consumo de agua Superficial (m³/día)', 2, 4, 'A'),

(19, 'Consumo de gas natural (m³/año)', 2, 4, 'A'),

(20, 'Utilización de productos peligrosos (m³/año)', 2, 4, 'A'),

(21, 'Generación de residuos sólidos Residuos peligrosos (tm/año)', 2, 4, 'A'),

(22, 'Generación de residuos sólidos Residuos no peligrosos (tm/año)', 2, 4, 'A'),

(23, '¿Es aplicable al proyecto? (SI/NO)', 2, 9, 'A'),

(24, '¿La empresa lo tiene implementado?(SI/NO)', 2, 9, 'A'),

(25, 'Criterios socio-ambientales para selección de nuevos negocios. Aplicable(SI/NO)', 2, 9, 'A'),

(26, 'Criterios socio-ambientales para selección de nuevos negocios. Existe(SI/NO)', 2, 9, 'A'),

(27, 'Procedimiento de evaluación de impactos acumulativos de nuevos proyectos. Aplicable(SI/NO)', 2, 9, 'A'),

(28, 'Procedimiento de evaluación de impactos acumulativos de nuevos proyectos. Existe(SI/NO)', 2, 9, 'A'),

(29, 'Código de ética. Aplicable(SI/NO)', 2, 9, 'A'),

(30, 'Código de ética. Existe(SI/NO)', 2, 9, 'A'),

(31, 'Código de conducta para los trabajadores. Aplicable(SI/NO)', 2, 9, 'A');



select c.idCuestionario,t_c.nombreTipoCuestionario,c.ordenPregunta, c.tituloCuestionario from tb_cuestionario as c JOIN tb_tipoCuestionario as t_c on c.idTipoCuestionario = t_c.idTipoCuestionario;



-- 5. Realizar el registro de un mínimo de 10 asignaciones en la tabla Evaluación. 



INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (1, 1, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (2, 2, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (3, 3, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (4, 4, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (1, 5, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (2, 6, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (3, 7, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (4, 8, 'A');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (1, 9, 'I');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (2, 10, 'I');

INSERT INTO tb_evaluacion (idModulo, idCliente, estadoEvaluacion) VALUES (3, 11, 'I');



-- 6. Elabore un reporte para que el cliente pueda visualizar la encuesta, donde se liste los siguientes campos: 

-- Id Evaluación

-- Nombre Cliente

-- Número Módulo

-- Módulo

-- Id Cuestionario

-- Orden Pregunta

-- Preguntas del Cuestionario





SELECT 

evaluacion.idEvaluacion, cliente.nombreCliente, 

  modulo.numeroModulo, modulo.nombreModulo, 

  cuestionario.idCuestionario, cuestionario.ordenPregunta, 

  cuestionario.tituloCuestionario 

FROM tb_cliente as cliente 

inner join tb_evaluacion as evaluacion ON cliente.idCliente = evaluacion.idCliente

left join tb_modulo as modulo ON evaluacion.idModulo = modulo.idModulo

left join tb_cuestionario as cuestionario ON modulo.idModulo = cuestionario.idModulo

where modulo.estadoModulo != "I" ;



-- 7. Según el reporte de la encuesta elaborado en la pregunta 6, responder las preguntas y registrar en la tabla respuesta 



INSERT INTO tb_respuesta (idEvaluacion, idCuestionario, respuestaEvaluacion, fechaRespuesta) 

VALUES (1, 1, 'Razon Social', NOW()),
(2, 2, '1234567890', NOW()),
(3, 3, 'Calle Principal #123', NOW()),
(4, 4, 'Juan Pérez', NOW()),
(5, 5, 'juanperez@example.com', NOW()),
(6, 6, '123456789', NOW()),
(7, 7, 'Préstamo de $100,000 a 5 años', NOW()),
(8, 8, '$150,000', NOW()),
(9, 9, 'Comentario de evaluación', NOW()),
(10, 10, '10 km', NOW()),
(11, 11, 'SI', NOW()),
(1, 12, '5 km', NOW()),
(2, 13, '3 km', NOW()),
(4, 14, 'Sí', NOW()),
(5, 15, '20', NOW()),
(6, 16, '5', NOW()),
(7, 17, '5000 kWh/año', NOW()),
(8, 18, '100 m³/día', NOW()),
(9, 19, '200 m³/año', NOW()),
(10, 20, '25 m³/año', NOW()),
(1, 21, '10 tm/año', NOW()),
(2, 22, '15 tm/año', NOW()),
(3, 23, 'SI', NOW()),
(4, 24, 'SI', NOW()),
(5, 25, 'Sí', NOW()),
(6, 26, 'Sí', NOW()),
(7, 27, 'Sí', NOW()),
(8, 28, 'Sí', NOW()),
(9, 29, 'Sí', NOW()),
(10, 30, 'Sí', NOW()),
(1, 31, 'Sí', NOW());



select * from tb_respuesta;



-- 8. Elaborar un reporte donde se pueda visualizar la encuesta con su respectiva respuesta

-- Id Evaluación

-- Nombre Cliente

-- Id Cuestionario

-- Orden Pregunta

-- Preguntas del Cuestionario

-- Respuesta

-- Fecha Respuesta (dd/mm/yyyy)

-- Comentario



SELECT evaluacion.idEvaluacion, cliente.nombreCliente, 
modulo.numeroModulo, modulo.nombreModulo, 
cuestionario.idCuestionario, cuestionario.ordenPregunta, 
cuestionario.tituloCuestionario, respuesta.respuestaEvaluacion, respuesta.fechaRespuesta
FROM tb_cliente as cliente 
inner join tb_evaluacion as evaluacion ON cliente.idCliente = evaluacion.idCliente
left join tb_modulo as modulo ON evaluacion.idModulo = modulo.idModulo
left join tb_cuestionario as cuestionario ON modulo.idModulo = cuestionario.idModulo
inner join tb_respuesta as respuesta on respuesta.idCuestionario = cuestionario.idCuestionario;





-- 9. Realizar un eliminado lógico (inactivo I)

-- y mostrar las preguntas del cuestionario, según las siguientes consideraciones



select * from tb_cuestionario as cuestionario 
inner join tb_respuesta as respuesta where cuestionario.tituloCuestionario like '%(SI/NO)%' or 'Código'; 




 Enviar una copia por correo electrónico a los destinatarios
Mensaje
