const cds = require('@sap/cds')

module.exports = class SalesOrderService extends cds.ApplicationService {
  async init() {

    const { SalesOrder, ZSalesOrder } = cds.entities('SalesOrderService')
    const salesorder_api = await cds.connect.to('ZAPI_SALES_ORDER_SRV')

    this.on('READ', ZSalesOrder, async (req) => {
      return salesorder_api.tx(req).run(req.query)
    });

    this.on('READ', 'Configuration', async req => {
      req.reply({
        isAdmin: req.user.is('Manager') //Manager is the role, which for example is also used in @requires annotation
      });
    });

    this.on('approveSalesOrder', async (req) => {
      const { approvalStatus, netValue } = req.data
      console.log('approveSalesOrder called', req.data)
      const keys = req.params[0]
      if ( approvalStatus !== 'Aprroved' ){
        await UPDATE(SalesOrder, keys).with({ approvalStatus: 'Approved' })
      }
      if (netValue > 100000) {
        await UPDATE(SalesOrder, keys).with({ approvalStatus: 'Approved' })
      }
      return await SELECT.one.from(SalesOrder).where(keys)
    })

    this.before('EDIT', SalesOrder, req => {
      if (req.data.approvalStatus === 'Approved') {
        req.error(400, "You can't modify this approved orders.")
      }
      return req.data
    })

    this.on('rejectSalesOrder', async (req) => {
      const { approvalStatus, netValue } = req.data
      console.log('approveSalesOrder called', req.data)
      const keys = req.params[0]
      if ( approvalStatus !== 'Reject' ){
        await UPDATE(SalesOrder, keys).with({ approvalStatus: 'Rejected' })
      }
      if (netValue > 100000) {
        await UPDATE(SalesOrder, keys).with({ approvalStatus: 'Rejected' })
      }
      return await SELECT.one.from(SalesOrder).where(keys)
    })
    return super.init()
  }
}
