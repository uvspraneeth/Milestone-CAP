using { ZAPI_SALES_ORDER_SRV } from '../srv/external/ZAPI_SALES_ORDER_SRV.cds'; 
using {
    cuid,
    managed
} from '@sap/cds/common';

namespace uvs;


type ApprovalStatus : String enum {
    Pending;
    Approved;
    Rejected
}

entity SalesOrderApproval : cuid, managed {
    salesOrderId   : String;
    salesOrg       : String;
    soldToParty    : String;
    netValue       : Decimal;
    currency       : String;
    approvalStatus : ApprovalStatus;
    approverComment : String;

}
