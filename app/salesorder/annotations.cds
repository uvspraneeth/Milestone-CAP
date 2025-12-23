using SalesOrderService as service from '../../srv/so-service';
annotate service.SalesOrder with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Salesorderid}',
                Value : salesOrderId,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Salesorg}',
                Value : salesOrg,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Soldtoparty1}',
                Value : soldToParty,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Netvalue}',
                Value : netValue,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Currency2}',
                Value : currency,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Approvalstatus}',
                Value : approvalStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Approvercomment}',
                Value : approverComment,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>SalesOrderId}',
            Value : salesOrderId,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Organization}',
            Value : salesOrg,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>SoldToParty}',
            Value : soldToParty,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>NetValue}',
            Value : netValue,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Currency1}',
            Value : currency,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'SalesOrderService.approveSalesOrder',
            Label : '{i18n>Approvesalesorder}',
            @UI.hidden : { $edmJson: {$Not: { $Path: '/SalesOrderService.EntityContainer/Configuration/isAdmin'} } }
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'SalesOrderService.rejectSalesOrder',
            Label : '{i18n>Rejectsalesorder}',
            @UI.hidden : { $edmJson: {$Not: { $Path: '/SalesOrderService.EntityContainer/Configuration/isAdmin'} } }
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : '{i18n>TableView}',
    },
);

annotate service.ZSalesOrder with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : DistributionChannel,
            Label : '{i18n>Distributionchannel}',
        },
        {
            $Type : 'UI.DataField',
            Value : SalesOrder,
            Label : '{i18n>Salesorder}',
        },
        {
            $Type : 'UI.DataField',
            Value : PurchaseOrderByCustomer,
            Label : '{i18n>Purchaseorderbycustomer}',
        },
        {
            $Type : 'UI.DataField',
            Value : SalesOrderType,
            Label : '{i18n>Salesordertype}',
        },
        {
            $Type : 'UI.DataField',
            Value : SalesOrganization,
            Label : '{i18n>Salesorganization}',
        },
        {
            $Type : 'UI.DataField',
            Value : SoldToParty,
            Label : '{i18n>Soldtoparty}',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : '{i18n>TableViewZsalesorder}',
    },

    UI.CreateHidden : { $edmJson: {$Not: { $Path: '/SalesOrderService.EntityContainer/Configuration/isAdmin'} } },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Orderobject}',
            ID : 'i18nOrderobject',
            Target : '@UI.Identification',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : SalesOrganization,
            Label : '{i18n>Salesorganization1}',
        },
        {
            $Type : 'UI.DataField',
            Value : SalesOrderType,
            Label : '{i18n>Salesordertype1}',
        },
        {
            $Type : 'UI.DataField',
            Value : SalesOrder,
            Label : '{i18n>Salesorder1}',
        },
        {
            $Type : 'UI.DataField',
            Value : PurchaseOrderByCustomer,
            Label : '{i18n>Purchaseorderbycustomer1}',
        },
        {
            $Type : 'UI.DataField',
            Value : DistributionChannel,
            Label : '{i18n>Distributionchannel1}',
        },
        {
            $Type : 'UI.DataField',
            Value : SoldToParty,
            Label : '{i18n>Soldtoparty2}',
        },
    ],
);

