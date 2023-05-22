namespace com.jarcia;

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

//Tipo Matriz o arreglo
// ---------------------------------------------------------------------------------------------------------------------------
// type EmailAddress : many {  // una forma de declarar la matriz
//     kind    : String;
//     Email   : String;
// };

// type EmailAddress_01 : array of {   // otra forma de declarar la matriz
//     kind    : String;
//     Email   : String;
// };

// entity Email {
//     Email   : EmailAddress;             //llamando a la matriz o array como tipo estructurado
//     Email_01   : many EmailAddress_01;  // llamando array of
//     Email_02    : many {                // armando los datos
//         kind    : String;               // son 3 propiedades con los mismos datos declaras de distinta manera
//         Email   : String;
//     }
// }
// ------------------------------------------------------------------------------------------------------------------------

// Enumeraciones
//-------------------------------------------------------------------------------------------------------------------------
// type Gender : String enum {              ----> se puede generar un type enum y utilizarlo
//     male;
//     famale;
// };
// entity Order {
//     ClientGender : Gender;
//     status  : Integer enum {           ----> usarlo directamente en la definicion
//         submitted = 1;
//         fulfiller = 2;
//         Shipped   = 3;
//         cancel    = -1;
//     };
//     priority    : String @assert.range enum {    ----> si es string se debe colocar @assert.range
//         hight;
//         medium;
//         low;
//     };
// }
// ------------------------------------------------------------------------------------------------------------------------

// Propiedades de entidad virtuales
// entity Car {
//     key ID                : UUID;
//         Name              : String;
//         virtual dicount_1 : Decimal;         //----> de esta manera y usado la annotation se podra escribir sobre dicho dato.
//         @Core.Computed : false
//         virtual dicount_2 : Decimal;         //----> quedando de esta manera no se podra escribir (no va un post).
// };


type Dec : Decimal(16, 2);

entity Products {
    key ID               : UUID not null;
        Name             : String not null;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price; //Decimal(16, 2);  --> es otra manera de tipar las propiedades de la entidad
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID      : UUID;
        Name    : Products:Name; //String;  --> otra menera de tipar propiedades basado en otra entidad.
        address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};

// entity Suppliers_01 {
//     key ID     : UUID;
//         Name   : String;
//         address : Address;
//         Email  : String;
//         Phone  : String;
//         Fax    : String;
// };

entity Category {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key ID         : UUID;
        createdAt  : DateTime;
        createdBy  : String;
        modifiedAt : DateTime;
        modifiedby : String;
        Name       : String;
        Rating     : Integer;
        Comment    : String;
        Product_ID : UUID;
};

entity SalesDate {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2)
}
