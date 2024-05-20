using {com.productos as db} from '../db/schema';

service productos {
    entity producto     as projection on db.producto;
    entity detalle      as projection on db.detalle;
    entity proveedor    as projection on db.proveedor;
    entity contacto     as projection on db.contacto;
    entity categoria    as projection on db.vh_categoria;
    entity subcategoria as projection on db.vh_subcategoria;
    entity estado       as projection on db.vh_estado;
}
