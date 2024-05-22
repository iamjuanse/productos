namespace com.productos;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity producto : cuid, managed {
    codigo       : String(7);
    nombre       : String(100);
    descripcion  : String(100);
    urlimagen    : String;
    valoracion   : Decimal(2, 2);
    precio       : Decimal(10, 2) @Measures.ISOCurrency: 'moneda';
    moneda       : String         @Common.IsCurrency;
    color_estado : Int16;
    categoria    : Association to one vh_categoria;
    subcategoria : Association to one vh_subcategoria;
    estado       : Association to one vh_estado;
    proveedor    : Association to one contacto;
    todetalle    : Composition of many detalle
                       on todetalle.producto = $self;
}

entity detalle : cuid {
    altura      : Decimal(4, 2);
    ancho       : Decimal(4, 2);
    profundidad : Decimal(4, 2);
    peso        : Decimal(4, 2);
    um_alt      : String;
    um_anc      : String;
    um_pro      : String;
    um_pes      : String;
    producto    : Association to one producto;
}

entity proveedor : cuid {
    nombre   : String;
    urlweb   : String;
    contacto : Association to one contacto;
}

entity contacto : cuid {
    nombre   : String;
    email    : String;
    telefono : String;
}

entity vh_categoria : cuid, CodeList {
    tosubcategoria : Composition of many vh_subcategoria
                         on tosubcategoria.categoria = $self;
}

entity vh_subcategoria : cuid, CodeList {
    categoria : Association to one vh_categoria;
}

entity vh_estado : CodeList {
    key codigo : String enum {
            EnStock  = 'En Stock';
            SinStock = 'Sin Stock';
        };
}
