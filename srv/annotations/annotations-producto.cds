using {productos as srv} from '../services';

annotate srv.producto with {
    codigo       @title: 'Codigo';
    nombre       @title: 'Producto';
    descripcion  @title: 'Descripcion';
    urlimagen    @title: 'Imagen';
    valoracion   @title: 'Valoracion';
    precio       @title: 'Precio';
    moneda       @title: 'Moneda';
    categoria    @title: 'Categoria';
    subcategoria @title: 'Sub-Categoria';
    proveedor    @title: 'Proveedor';
    estado       @title: 'Disponibilidad';
};

annotate srv.producto with {
    //urlimagen    @UI.IsImageURL  @Core.MediaType: 'image/png';
    categoria    @Common: {
        Text           : categoria.name,
        TextArrangement: #TextOnly
    };
    subcategoria @Common: {
        Text           : subcategoria.name,
        TextArrangement: #TextOnly,
    };
};

annotate srv.producto with @(
    UI.SelectionFields      : [
        categoria_ID,
        subcategoria_ID,
        proveedor_ID,
        estado_codigo
    ],
    UI.HeaderInfo           : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Producto',
        TypeNamePlural: 'Productos',
        Title         : {
            $Type: 'UI.DataField',
            Value: nombre,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: codigo,
        },
    },
    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: urlimagen,
        },
        {
            $Type: 'UI.DataField',
            Value: nombre,
        },
        {
            $Type: 'UI.DataField',
            Value: categoria_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: subcategoria_ID,
        },
        {
            $Type      : 'UI.DataField',
            Value      : estado_codigo,
            Criticality: color_estado,
        },
        {
            $Type                : 'UI.DataFieldForAnnotation',
            Target               : '@UI.DataPoint#valoracion',
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '120px',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: precio,
        },
    ],
    UI.DataPoint #valoracion: {
        $Type        : 'UI.DataPointType',
        Value        : valoracion,
        Visualization: #Rating,
    },
);
