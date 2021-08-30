--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11),
  `NombreCategoria` varchar(15) DEFAULT NULL,
  `Descripcion` mediumtext,
  `Imagen` mediumblob
);

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `IdCliente` varchar(5),
  `NombreCompania` varchar(40) DEFAULT NULL,
  `NombreContacto` varchar(30) DEFAULT NULL,
  `CargoContacto` varchar(30) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `CodPostal` varchar(10) DEFAULT NULL,
  `Pais` varchar(15) DEFAULT NULL,
  `Telefono` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL
);

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

CREATE TABLE IF NOT EXISTS `detalles_pedidos` (
  `IdPedido` int(11),
  `IdProducto` int(11),
  `PrecioUnidad` double DEFAULT NULL,
  `Cantidad` smallint(6) DEFAULT NULL,
  `Descuento` float DEFAULT NULL
);

--
-- Estructura de tabla para la tabla `distribuidores`
--

CREATE TABLE IF NOT EXISTS `distribuidores` (
  `IdDistribuidor` int(11),
  `NombreCompania` varchar(40) DEFAULT NULL,
  `Telefono` varchar(24) DEFAULT NULL
);

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `IdEmpleado` int(11),
  `Apellidos` varchar(20) DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Cargo` varchar(30) DEFAULT NULL,
  `Tratamiento` varchar(25) DEFAULT NULL,
  `FechaNacimiento` datetime DEFAULT NULL,
  `FechaContratacion` datetime DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `CodPostal` varchar(10) DEFAULT NULL,
  `Pais` varchar(15) DEFAULT NULL,
  `TelDomicilio` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Notas` mediumtext,
  `Jefe` int(11) DEFAULT NULL
);

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `IdPedido` int(11),
  `IdCliente` varchar(5),
  `IdEmpleado` int(11),
  `FechaPedido` datetime DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `FechaEnvio` datetime DEFAULT NULL,
  `FormaEnvio` int(11) DEFAULT NULL,
  `Cargo` double DEFAULT NULL,
  `Destinatario` varchar(40) DEFAULT NULL,
  `DireccionDestinatario` varchar(60) DEFAULT NULL,
  `CiudadDestinatario` varchar(15) DEFAULT NULL,
  `RegionDestinatario` varchar(15) DEFAULT NULL,
  `CodPostalDestinatario` varchar(10) DEFAULT NULL,
  `PaisDestinatario` varchar(15) DEFAULT NULL
);

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11),
  `NombreProducto` varchar(40) DEFAULT NULL,
  `IdProveedor` int(11),
  `IdCategoria` int(11),
  `CantidadPorUnidad` varchar(20) DEFAULT NULL,
  `PrecioUnidad` double DEFAULT NULL,
  `UnidadesEnExistencia` smallint(6) DEFAULT NULL,
  `UnidadesEnPedido` smallint(6) DEFAULT NULL,
  `NivelNuevoPedido` int(11) DEFAULT NULL,
  `Suspendido` CHAR(1) DEFAULT '0'
);

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `IdProveedor` int(11),
  `NombreCompania` varchar(40) DEFAULT NULL,
  `NombreContacto` varchar(30) DEFAULT NULL,
  `CargoContacto` varchar(30) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `CodPostal` varchar(10) DEFAULT NULL,
  `Pais` varchar(15) DEFAULT NULL,
  `Telefono` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `PaginaPrincipal` mediumtext
);