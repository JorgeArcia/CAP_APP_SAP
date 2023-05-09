using {com.jarcia as jarcia} from '../db/schema';

service CustomerServices {
    entity CustomerSrv as projection on jarcia.Customer;
}
