-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-05-2026 a las 04:10:19
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laboratorios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_reserva`
--

CREATE TABLE `historial_reserva` (
  `id_historial_reserva` int NOT NULL,
  `det_reserva` int NOT NULL,
  `fecha_cambio_historial_reserva` datetime NOT NULL,
  `estado_anterior_historial_reserva` varchar(30) NOT NULL,
  `estado_nuevo_historial_reserva` varchar(30) NOT NULL,
  `observacion_historial_reserva` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `historial_reserva`
--

INSERT INTO `historial_reserva` (`id_historial_reserva`, `det_reserva`, `fecha_cambio_historial_reserva`, `estado_anterior_historial_reserva`, `estado_nuevo_historial_reserva`, `observacion_historial_reserva`) VALUES
(1, 2, '2026-05-04 18:44:13', 'pendiente', 'aprobada', 'Reserva aprobada por administración'),
(2, 5, '2026-05-05 12:48:21', 'pendiente', 'aprobada', 'Aceptada sin problemas'),
(3, 4, '2026-05-05 12:48:28', 'pendiente', 'aprobada', 'Aprobada'),
(4, 3, '2026-05-05 12:48:34', 'pendiente', 'aprobada', 'texto prueba'),
(5, 6, '2026-05-06 15:37:05', 'pendiente', 'aprobada', 'Aprobado sin problemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL,
  `nombre_insumo` varchar(120) NOT NULL,
  `descripcion_insumo` varchar(255) DEFAULT NULL,
  `unidad_medida_insumo` varchar(50) NOT NULL,
  `stock_actual_insumo` int NOT NULL,
  `stock_minimo_insumo` int NOT NULL,
  `estado_insumo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `insumo`
--

INSERT INTO `insumo` (`id_insumo`, `nombre_insumo`, `descripcion_insumo`, `unidad_medida_insumo`, `stock_actual_insumo`, `stock_minimo_insumo`, `estado_insumo`) VALUES
(1, 'Guantes clínicos', 'Caja de guantes talla M', 'caja', 50, 10, 'activo'),
(2, 'Jeringas desechables', 'Jeringas de 5 ml', 'unidad', 100, 50, 'activo'),
(3, 'Mascarillas quirúrgicas', 'Mascarillas de 3 capas', 'caja', 80, 20, 'activo'),
(4, 'Suero fisiológico', 'Bolsa de 500 ml', 'unidad', 100, 30, 'activo'),
(5, 'Termómetro digital', 'Termómetro clínico', 'unidad', 9, 5, 'activo'),
(6, 'Gazas', 'Esterilizada', 'Bolsa', 100, 40, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int NOT NULL,
  `nombre_laboratorio` varchar(100) NOT NULL,
  `ubicacion_laboratorio` varchar(150) NOT NULL,
  `capacidad_laboratorio` int NOT NULL,
  `estado_laboratorio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`id_laboratorio`, `nombre_laboratorio`, `ubicacion_laboratorio`, `capacidad_laboratorio`, `estado_laboratorio`) VALUES
(1, 'Lab Simulación 1', 'Edificio A', 20, 'disponible'),
(2, 'Lab Simulación 2', 'Edificio A', 15, 'disponible'),
(4, 'Lab Simulación 3', 'Edificio A', 45, 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_stock`
--

CREATE TABLE `movimiento_stock` (
  `id_movimiento_stock` int NOT NULL,
  `det_insumo` int NOT NULL,
  `tipo_movimiento_stock` varchar(30) NOT NULL,
  `cantidad_movimiento_stock` int NOT NULL,
  `fecha_movimiento_stock` datetime NOT NULL,
  `motivo_movimiento_stock` varchar(150) NOT NULL,
  `referencia_movimiento_stock` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `movimiento_stock`
--

INSERT INTO `movimiento_stock` (`id_movimiento_stock`, `det_insumo`, `tipo_movimiento_stock`, `cantidad_movimiento_stock`, `fecha_movimiento_stock`, `motivo_movimiento_stock`, `referencia_movimiento_stock`) VALUES
(1, 2, 'salida', 5, '2026-05-04 18:33:31', 'Insumo asociado a reserva', 'Reserva ID 2'),
(2, 5, 'salida', 5, '2026-05-05 12:28:26', 'Insumo asociado a reserva', 'Reserva ID 4'),
(3, 2, 'salida', 50, '2026-05-05 12:43:02', 'Insumo asociado a reserva', 'Reserva ID 5'),
(4, 5, 'salida', 1, '2026-05-06 15:34:36', 'Insumo asociado a reserva', 'Reserva ID 6'),
(5, 6, 'salida', 50, '2026-05-11 22:32:25', 'Insumo asociado a reserva', 'Reserva ID 7'),
(6, 2, 'salida', 45, '2026-05-11 22:33:47', 'Insumo asociado a reserva', 'Reserva ID 7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int NOT NULL,
  `nombre_permiso` varchar(50) NOT NULL,
  `descripcion_permiso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `nombre_permiso`, `descripcion_permiso`) VALUES
(1, 'Administrador', 'Permiso total en el sistema'),
(2, 'Auxiliar', 'Solo puede visualizar reservas'),
(3, 'Docente', 'Puede reservar laboratorios, subir planificación y seleccionar insumos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int NOT NULL,
  `asignatura_reserva` varchar(120) NOT NULL,
  `seccion_reserva` varchar(30) DEFAULT NULL,
  `fecha_reserva` date NOT NULL,
  `hora_inicio_reserva` time NOT NULL,
  `hora_fin_reserva` time NOT NULL,
  `tipo_fidelidad_reserva` varchar(30) NOT NULL,
  `estado_actual_reserva` varchar(30) NOT NULL,
  `det_laboratorio` int NOT NULL,
  `det_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `asignatura_reserva`, `seccion_reserva`, `fecha_reserva`, `hora_inicio_reserva`, `hora_fin_reserva`, `tipo_fidelidad_reserva`, `estado_actual_reserva`, `det_laboratorio`, `det_usuario`) VALUES
(2, 'Enfermería II', 'A', '2026-01-15', '10:00:00', '12:00:00', 'alta', 'aprobada', 1, 1),
(3, 'Enfermeria III', 'A', '2026-01-20', '09:00:00', '11:00:00', 'alta', 'aprobada', 1, 1),
(4, 'Enfermeria Adulto', 'A', '2026-05-07', '08:00:00', '10:00:00', 'alta', 'aprobada', 4, 1),
(5, 'Niño Patologico', 'A', '2026-05-11', '11:00:00', '13:00:00', 'baja', 'aprobada', 1, 1),
(6, 'Proceso', 'A', '2026-05-11', '08:00:00', '10:00:00', 'media', 'aprobada', 2, 1),
(7, 'Proceso de Enfermería', 'A', '2026-05-11', '08:00:00', '13:00:00', 'alta', 'pendiente', 4, 1),
(8, 'Proceso de Enfermería del Niño', 'A', '2026-05-25', '08:00:00', '11:00:00', 'media', 'pendiente', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_insumo`
--

CREATE TABLE `reserva_insumo` (
  `det_reserva` int NOT NULL,
  `det_insumo` int NOT NULL,
  `cantidad_solicitada_reserva_insumo` int NOT NULL,
  `observacion_reserva_insumo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `reserva_insumo`
--

INSERT INTO `reserva_insumo` (`det_reserva`, `det_insumo`, `cantidad_solicitada_reserva_insumo`, `observacion_reserva_insumo`) VALUES
(2, 1, 5, 'Uso en simulación'),
(2, 2, 5, 'Uso en simulación'),
(4, 5, 5, 'Para evaluacion'),
(5, 2, 50, 'Para procedimiento'),
(6, 5, 1, 'Para testeo'),
(7, 2, 45, 'asdas'),
(7, 6, 50, 'Para procesos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre_usuario` varchar(120) NOT NULL,
  `correo_usuario` varchar(120) NOT NULL,
  `password_usuario` varchar(255) NOT NULL,
  `estado_usuario` varchar(30) NOT NULL,
  `det_permiso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `correo_usuario`, `password_usuario`, `estado_usuario`, `det_permiso`) VALUES
(1, 'Docente Demo', 'docente@demo.cl', '123456', 'activo', 3),
(2, 'Administrador', 'administrador@demo.cl', '123456', 'activo', 1),
(3, 'Auxiliar', 'auxiliar@demo.cl', '123456', 'activo', 2),
(4, 'Administrador 2', 'admin2@demo.cl', '123456', 'activo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial_reserva`
--
ALTER TABLE `historial_reserva`
  ADD PRIMARY KEY (`id_historial_reserva`),
  ADD KEY `fk_historial_reserva` (`det_reserva`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  ADD PRIMARY KEY (`id_movimiento_stock`),
  ADD KEY `fk_movimiento_stock_insumo` (`det_insumo`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `fk_reserva_laboratorio` (`det_laboratorio`),
  ADD KEY `fk_reserva_usuario` (`det_usuario`);

--
-- Indices de la tabla `reserva_insumo`
--
ALTER TABLE `reserva_insumo`
  ADD PRIMARY KEY (`det_reserva`,`det_insumo`),
  ADD KEY `fk_reserva_insumo_insumo` (`det_insumo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_usuario` (`correo_usuario`),
  ADD KEY `fk_usuario_permiso` (`det_permiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial_reserva`
--
ALTER TABLE `historial_reserva`
  MODIFY `id_historial_reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `insumo`
--
ALTER TABLE `insumo`
  MODIFY `id_insumo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  MODIFY `id_movimiento_stock` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_reserva`
--
ALTER TABLE `historial_reserva`
  ADD CONSTRAINT `fk_historial_reserva` FOREIGN KEY (`det_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Filtros para la tabla `movimiento_stock`
--
ALTER TABLE `movimiento_stock`
  ADD CONSTRAINT `fk_movimiento_stock_insumo` FOREIGN KEY (`det_insumo`) REFERENCES `insumo` (`id_insumo`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_laboratorio` FOREIGN KEY (`det_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`),
  ADD CONSTRAINT `fk_reserva_usuario` FOREIGN KEY (`det_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `reserva_insumo`
--
ALTER TABLE `reserva_insumo`
  ADD CONSTRAINT `fk_reserva_insumo_insumo` FOREIGN KEY (`det_insumo`) REFERENCES `insumo` (`id_insumo`),
  ADD CONSTRAINT `fk_reserva_insumo_reserva` FOREIGN KEY (`det_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`det_permiso`) REFERENCES `permiso` (`id_permiso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
