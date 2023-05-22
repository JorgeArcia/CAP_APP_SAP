using {com.jarcia as jarcia} from '../db/schema';

service CatalogServices {
    entity Products as projection on jarcia.Products;
    entity Suppliers as projection on jarcia.Suppliers;
    // entity Suppliers_01 as projection on jarcia.Suppliers_01;
    // entity Car as projection on jarcia.Car;
}
