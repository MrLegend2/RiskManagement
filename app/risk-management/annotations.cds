using RiskService as service from '../../srv/risk-service';
using from '../riskmanagement/annotations';

annotate service.Risks with {
    bp @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BusinessPartners',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : bp_BusinessPartner,
                ValueListProperty : 'BusinessPartner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FullName',
            },
        ],
    }
};
annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Manipulation',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact1',
            Label : 'BusinessPartner',
        },
    ]
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact2 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact2',
                Label : '{i18n>Businesspartner1}',
            },
        ],
    }
);
