ALTER TABLE categorias
ADD PRIMARY KEY (IdCategoria);

ALTER TABLE clientes
ADD PRIMARY KEY (IdCliente);

ALTER TABLE distribuidores
ADD PRIMARY KEY (IdDistribuidor);

ALTER TABLE empleados
ADD PRIMARY KEY (IdEmpleado);

ALTER TABLE pedidos
ADD PRIMARY KEY (IdPedido);

ALTER TABLE productos
ADD PRIMARY KEY (IdProducto);

ALTER TABLE proveedores
ADD PRIMARY KEY (IdProveedor);

ALTER TABLE detalles_pedidos
ADD FOREIGN KEY (IdPedido) REFERENCES pedidos(IdPedido);

ALTER TABLE detalles_pedidos
ADD FOREIGN KEY (IdProducto) REFERENCES productos(IdProducto);

ALTER TABLE pedidos
ADD FOREIGN KEY (IdCliente) REFERENCES clientes(IdCliente);

ALTER TABLE pedidos
ADD FOREIGN KEY (IdEmpleado) REFERENCES empleados(IdEmpleado);

ALTER TABLE productos
ADD FOREIGN KEY (IdProveedor) REFERENCES proveedores(IdProveedor);

ALTER TABLE productos
ADD FOREIGN KEY (IdCategoria) REFERENCES categorias(IdCategoria);
