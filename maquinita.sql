create table if not exists formapago
(
    forma_id int auto_increment primary key,
    NAME     varchar(200) null
);

create table if not exists factura
(
    factura_id  int auto_increment  primary key,
    created_at  datetime     null,
    tipoPago    int          not null,
    precioTotal varchar(200) null,
    STATUS      int          not null,
    constraint factura___fk_pago
    foreign key (tipoPago) references formapago(forma_id)
    on update cascade on delete cascade
);

create table if not exists proveedor
(
    idproveedor       int    auto_increment  primary key,
    nombre            varchar(45) not null,
    nit               varchar(45) not null,
    direccion         varchar(45) not null,
    telefono          int         not null,
    correo            varchar(45) not null,
    empresa_idempresa int         not null
);

create table if not exists producto
(
    idproducto            int     auto_increment primary key,
    nombre                varchar(45) not null,
    tipo                  varchar(45) not null,
    productocol           float       not null,
    proveedor_idproveedor int         not null,
    constraint fk_producto_proveedor1
        foreign key (proveedor_idproveedor) references proveedor(idproveedor)
);

create index fk_producto_proveedor1_idx
    on producto (proveedor_idproveedor);

create index fk_proveedor_empresa1_idx
    on proveedor (empresa_idempresa);

create table if not exists roltipo
(
    rol_id      int auto_increment primary key,
    description varchar(200) null
);

create table if not exists tecnico
(
    idtecnico int  auto_increment  primary key,
    nombre    varchar(45) not null,
    dpi       int         not null,
    apellido  varchar(45) not null,
    sueldo    float       not null,
    rolId     int         not null,
    direccion varchar(45) not null,
    telefono  int         not null,
    correo    varchar(45) not null,
    constraint tecnico___fk_rol
        foreign key (rolId) references roltipo(rol_id)
            on update cascade 
            on delete cascade
);

create table if not exists tipocomercio
(
    comercio_id int auto_increment  primary key,
    NAME        varchar(200) null
);

create table if not exists comercio
(
    idcomercio           int    auto_increment   primary key,
    nombre               varchar(45) not null,
    direccion            varchar(45) not null,
    tipoComercio         int         not null,
    num_maquinas         int         not null,
    TipoPago             int         null,
    porcentaje_mayorista float       null,
    renegociacion        float       null,
    constraint comercio___fk_pago
        foreign key (TipoPago) references formapago(forma_id)
            on update cascade 
            on delete cascade,
    constraint comercio___fk_tipo
        foreign key (tipoComercio) references tipocomercio(comercio_id)
            on update cascade 
            on delete cascade
);

create table if not exists asignacioncomercio
(
    asignacion_id int auto_increment primary key,
    idComercio    int not null,
    idProducto    int not null,
    constraint asignacioncomercio___fk_comercio
        foreign key (idComercio) references comercio(idcomercio)
            on update cascade 
            on delete cascade,
    constraint asignacioncomercio___fk_producto
        foreign key (idProducto) references producto(idproducto)
            on update cascade 
            on delete cascade
);

create table if not exists maquina
(
    idmaquina int    auto_increment  primary key,
    estado                  varchar(45) ,
    placa                   varchar(45) ,
    cascara                 varchar(45) ,
    tecnico_ensamblaje      varchar(45) ,
    tecnico_control_calidad varchar(45) ,
    maquinacol              varchar(45) ,
    comercio_idcomercio     int         not null,
    constraint fk_maquina_comercio1
        foreign key (comercio_idcomercio) references comercio(idcomercio)
);

create index fk_maquina_comercio1_idx
    on maquina (comercio_idcomercio);

create table if not exists repuesto
(
    repuesto_id    int auto_increment primary key,
    idProducto     int          not null,
    fecha          datetime     null,
    idCliente      int          not null,
    precioUnitario varchar(200) null,
    observacion    varchar(200) null,
    idFactura      int          null,
    constraint repuesto___fk_cliente
        foreign key (idCliente) references comercio(idcomercio)
            on update cascade 
            on delete cascade,
    constraint repuesto___fk_factura
        foreign key (idFactura) references factura(factura_id)
            on update cascade 
            on delete cascade,
    constraint repuesto___fk_producto
        foreign key (idProducto) references producto(idproducto)
            on update cascade 
            on delete cascade
);

create table if not exists servicio
(
    idservicio        int     auto_increment primary key,
    repuesto          varchar(45) null,
    diagnostico       varchar(45) not null,
    precio            int         null,
    tecnico_idtecnico int         not null,
    idMaquina         int         null,
    constraint fk_servicio_tecnico1
        foreign key (tecnico_idtecnico) references tecnico(idtecnico),
    constraint servicio___fk_maquina
        foreign key (idMaquina) references maquina(idmaquina)
            on update cascade 
            on delete cascade
);

create index fk_servicio_tecnico1_idx
    on servicio (tecnico_idtecnico);