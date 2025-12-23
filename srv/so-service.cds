using {uvs} from '../db/schema';
using {ZAPI_SALES_ORDER_SRV} from './external/ZAPI_SALES_ORDER_SRV';


service SalesOrderService @(requires: 'authenticated-user'){
    @odata.draft.enabled
    entity SalesOrder  as projection on uvs.SalesOrderApproval{
        *,
        orders : Association to ZSalesOrder on orders.SalesOrder = $self.salesOrderId
    }
        actions {
            action approveSalesOrder(salesOrderId: String) returns SalesOrder;
            action rejectSalesOrder(salesOrderId: String)  returns SalesOrder
        };

    @odata.singleton  @cds.persistence.skip
    entity Configuration {
        key ID      : String;
            isAdmin : Boolean;
    }


    entity ZSalesOrder as
        projection on ZAPI_SALES_ORDER_SRV.A_SalesOrder {
            SalesOrder,
            SalesOrderType,
            SalesOrganization,
            DistributionChannel,
            SoldToParty,
            PurchaseOrderByCustomer
        }
}
// State transition flow 
//    annotate SalesOrderService.SalesOrder with @flow.status: Status actions {
//         approveSalesOrder    @from: #Pending  @to: #Approved;
//         rejectSalesOrder    @from: #Approved  @to: #Rejected;
//     };
// 

