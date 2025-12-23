sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"uvs/salesorder/test/integration/pages/SalesOrderList",
	"uvs/salesorder/test/integration/pages/SalesOrderObjectPage"
], function (JourneyRunner, SalesOrderList, SalesOrderObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('uvs/salesorder') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesOrderList: SalesOrderList,
			onTheSalesOrderObjectPage: SalesOrderObjectPage
        },
        async: true
    });

    return runner;
});

