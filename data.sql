DELIMITER  //
        CREATE PROCEDURE sp_formapago_sel()
        BEGIN
            SELECT
                *
            FROM
                formapago;
        END //
DELIMITER ;

                    

DELIMITER  //
        CREATE PROCEDURE sp_formapago_ins ( in p_NombreP varchar(200) )
        BEGIN
            insert into formapago
                ( NAME )
            values
                (p_NombreP);
        END //
DELIMITER ;

 DELIMITER  //
        CREATE PROCEDURE sp_formapago_actu (in p_forma_id int, in p_NombreP varchar(200) )
        BEGIN
            update
                formapago
                set
                        NAME = p_NombreP
                WHERE
                forma_id = p_forma_id;
        END //
DELIMITER ;


DELIMITER  //
    CREATE PROCEDURE sp_formapago_delet (in p_forma_id int)
    BEGIN
        delete
            FROM formapago
            WHERE
            forma_id = p_forma_id;
    END //
DELIMITER ;

DELIMITER  //
    CREATE PROCEDURE sp_factura_sel()
    BEGIN
        SELECT
            *
        FROM
            factura;
    END //
DELIMITER ;

DELIMITER  //

CREATE PROCEDURE sp_factura_ins ( in p_created_at datetime, in p_tipoPago int, in p_precioTotal varchar(200) )
    BEGIN
        insert into factura
            ( created_at, tipoPago, precioTotal, STATUS)
        values
            (p_created_at , p_tipoPago, p_precioTotal, 1);
    END //
DELIMITER ;

DELIMITER  //
    CREATE PROCEDURE sp_factura_actu (in p_facturaid int, in p_created_at  datetime, in p_tipoPago int, in p_precioTotal varchar(200) )
    BEGIN
        update
            factura
            set
            created_at = p_created_at,
            tipoPago = p_tipoPago,
            precioTotal = p_precioTotal
            WHERE
            factura_id = p_facturaid;
    END //
 DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_factura_delete (in p_facturaid int)
        BEGIN
            delete
                FROM factura
                WHERE
                factura_id = p_facturaid;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_proveedor_sel()
        BEGIN
            SELECT
                *
            FROM
                proveedor;
        END //
DELIMITER ;

 DELIMITER  //
    CREATE PROCEDURE sp_proveedor_ins ( in p_idproveedor int, in p_nombre varchar(45), in p_nit varchar(45), in p_direccion varchar(45), in p_telefono int, in p_correo varchar(45), in p_empresa_idempresa int)
    BEGIN
        insert into proveedor
            ( idproveedor, nombre, nit, direccion, telefono, correo, empresa_idempresa)
        values
            (p_idproveedor, p_nombre, p_nit, p_direccion, p_telefono, p_correo, p_empresa_idempresa);
    END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_proveedor_actu (in p_idproveedor int, in p_nombre varchar(45), in p_nit varchar(45), in p_direccion varchar(45), in p_telefono int, in p_correo varchar(45), in p_empresa_idempresa int)
        BEGIN
            update
                proveedor
                set
                    nombre = p_nombre,
                    nit = p_nit,
                    direccion = p_direccion,
                    telefono = p_telefono,
                    correo = p_correo,
                    empresa_idempresa = p_empresa_idempresa
                WHERE
                idproveedor = p_idproveedor;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_proveedor_delet (in p_idproveedor int)
        BEGIN
            delete
                FROM proveedor
                WHERE
                idproveedor = p_idproveedor;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_producto_sel()
        BEGIN
            SELECT
                *
            FROM
                producto;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_producto_ins ( in p_nombre varchar(45), in p_tipo varchar(45), in p_productocol float, in p_proveedor_idproveedor int)
        BEGIN
            insert into producto
                ( nombre, tipo, productocol, proveedor_idproveedor)
            values
                (p_nombre, p_tipo, p_productocol, p_proveedor_idproveedor);
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_producto_actu (in p_idproducto int, in p_nombre varchar(45), in p_tipo varchar(45), in p_productocol float, in p_proveedor_idproveedor int)
        BEGIN
            update
                    producto
                    set
                        nombre = p_nombre,
                        tipo = p_tipo,
                        productocol = p_productocol,
                        proveedor_idproveedor = p_proveedor_idproveedor
                    WHERE
                    idproducto = p_idproducto;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_producto_delet (in p_idproducto int)
        BEGIN
            delete
                FROM producto
                WHERE
                idproducto = p_idproducto;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_roltipo_sel()
        BEGIN
            SELECT
                *
            FROM
                roltipo;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_roltipo_ins ( in p_descripticion varchar(200) )
        BEGIN
            insert into roltipo
                ( description )
            values
                (p_descripticion);
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_roltipo_actu (in p_rol_id int, in p_descripticion varchar(200) )
        BEGIN
            update
                    roltipo
                    set
                            descripticion = p_descripticion
                    WHERE
                    rol_id = p_rol_id;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_roltipo_delet (in p_rol_id int)
        BEGIN
            delete
                FROM roltipo
                WHERE
                rol_id = p_rol_id;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_tipocomercio_sel()
        BEGIN
            SELECT
                *
            FROM
                tipocomercio;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_tipocomercio_ins ( in p_nombreTipo varchar(200) )
        BEGIN
            insert into tipocomercio
                ( NAME )
            values
                (p_nombreTipo);
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_tipocomercio_actu (in p_comercio_id int, in p_nombreTipo varchar(200) )
        BEGIN
            update
                    tipocomercio
                    set
                            NAME = p_nombreTipo
                    WHERE
                    comercio_id = p_nombreTipo;
        END //
DELIMITER ;

DELIMITER  //
        CREATE PROCEDURE sp_tipocomercio_delet (in p_comercio_id int)
        BEGIN
            delete
                    FROM tipocomercio
                    WHERE
                    comercio_id = p_comercio_id;
        END //
DELIMITER ;



--Procedure Select
call sp_formapago_sel;
call sp_proveedor_sel;
call sp_producto_sel;
call sp_roltipo_sel;
call sp_tipocomercio_sel;
call sp_factura_sel;

--Procedure insert
call sp_formapago_ins('efectivo');
call sp_proveedor_ins(3,'gametra.S.A','14589-8','ciudad',25526588,'gametra@gamil.com',1);
call sp_producto_ins('consola','arcade',1.25,1);
call sp_roltipo_ins('usuario');
call sp_tipocomercio_ins('pequeño');
call sp_factura_ins(CURDATE(),1,'3650.50');

--Procedure Delete
call sp_formapago_delet(1);
call sp_factura_delete(2);
call sp_proveedor_delet(1);
call sp_producto_delet(1);
call sp_roltipo_delet(1);

--Procedure Update
call sp_formapago_actu(1,'cheque');
call sp_factura_actu(2,CURDATE(),2,'3582.00');
call sp_proveedor_actu(1,'gametra.S.A','14589-8','zona 4 de Mixco',28926588,'gametra@hotmail.com',1);
call sp_producto_actu(1,'tragamonedas','tragamonedas','zona 4 de Mixco',1);
call sp_roltipo_actu(1,'manager');
call sp_tipocomercio_actu(1,'mayorista');



-- Procedure Delete
call sp_tipocomercio_delet(1);

-- Drop all Procedures´s
drop PROCEDURE sp_formapago_ins;
drop PROCEDURE sp_formapago_actu;
drop PROCEDURE sp_formapago_delet;
drop PROCEDURE sp_factura_sel;
drop PROCEDURE sp_factura_ins;
drop PROCEDURE sp_factura_actu;
drop PROCEDURE sp_factura_delet;
drop PROCEDURE sp_proveedor_sel;
drop PROCEDURE sp_proveedor_ins;
drop PROCEDURE sp_proveedor_actu;
drop PROCEDURE sp_proveedor_delet;
drop PROCEDURE sp_producto_sel;
drop PROCEDURE sp_producto_ins;
drop PROCEDURE sp_producto_actu;
drop PROCEDURE sp_producto_delet;
drop PROCEDURE sp_roltipo_sel;
drop PROCEDURE sp_roltipo_ins;
drop PROCEDURE sp_roltipo_actu;
drop PROCEDURE sp_roltipo_delet;
drop PROCEDURE sp_tipocomercio_sel;
drop PROCEDURE sp_tipocomercio_ins;
drop PROCEDURE sp_tipocomercio_actu;
drop PROCEDURE sp_formapago_sel;
drop PROCEDURE sp_tipocomercio_delet;