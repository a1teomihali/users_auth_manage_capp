using user.mngr.srv.UserMngrService as service from '../../srv/user_auth_service';
using from '../../db/schema';


annotate service.User with @(
    UI.SelectionFields        : [
        ID,
        displayName,
        userName,
        isActive,
        isVerified
    ],

    UI.HeaderInfo             : {
        TypeName      : 'User',
        TypeNamePlural: 'Users',
        Title         : {Value: ID},
        Description   : {Value: displayName}
    },

    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Label: 'User ID',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Label: 'Full Name',
            Value: displayName
        },
        {
            $Type: 'UI.DataField',
            Label: 'Username',
            Value: userName
        },
        {
            $Type: 'UI.DataField',
            Label: 'BTP Sequence',
            Value: btpId
        },
        {
            $Type: 'UI.DataField',
            Label: 'User Mail',
            Value: eMail
        },
        {
            $Type: 'UI.DataField',
            Label: 'External ID',
            Value: externalId
        },
        {
            $Type: 'UI.DataField',
            Label: 'First Name',
            Value: firstName,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Label: 'Last Name',
            Value: lastName,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Label: 'IdP ID',
            Value: origin_ID,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Label: 'IdP Name',
            Value: origin.name
        },
        {
            $Type: 'UI.DataField',
            Label: 'IsActive',
            Value: isActive
        },
        {
            $Type: 'UI.DataField',
            Label: 'IsVerified',
            Value: isVerified
        }
    ],

    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet',
            Label : 'General Data',
            Target: '@UI.FieldGroup#GeneralData',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Authorizations',
            Label : 'Authorizations',
            Target: 'authorizations/@UI.LineItem#Authorizations'
        }
    ],

    UI.FieldGroup #GeneralData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'User ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'External ID',
                Value: externalId,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Label: 'First Name',
                Value: firstName,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Label: 'Last Name',
                Value: lastName,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Label: 'Full Name',
                Value: displayName
            },
            {
                $Type: 'UI.DataField',
                Label: 'User Name',
                Value: userName
            },
            {
                $Type: 'UI.DataField',
                Label: 'User Mail',
                Value: eMail
            },
            {
                $Type: 'UI.DataField',
                Label: 'IsActive',
                Value: isActive
            },
            {
                $Type: 'UI.DataField',
                Label: 'IsVerified',
                Value: isVerified
            }
        ],
    },
);


annotate service.UserAuthorization with @(UI.LineItem #Authorizations: [
    {
        $Type: 'UI.DataField',
        Label: '{i18n>User ID}',
        Value: parent_ID,
//        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Authorization ID}',
        Value: authorization_ID
    },
    {
        $Type: 'UI.DataField',
        Label: 'BTP Sequence',
        Value: parent.btpId
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Authorization Name}',
        Value: authorization.name
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>Authorization Description}',
        Value: authorization.description
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>IdP ID}',
        Value: parent.origin_ID
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>IdP Name}',
        Value: parent.origin.name
    },
    {
        $Type: 'UI.DataField',
        Label: 'created At',
        Value: createdAt,
        ![@UI.Hidden]

    },
    {
        $Type: 'UI.DataField',
        Label: 'created By',
        Value: createdBy,
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Label: 'modified At',
        Value: modifiedAt,
        ![@UI.Hidden]

    },
    {
        $Type: 'UI.DataField',
        Label: 'modified By',
        Value: modifiedBy,
        ![@UI.Hidden]
    }
]);

annotate service.User with {
    origin @Common: {ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'IdP',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: origin_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            }
        ]
    }, }
};

annotate service.User with {
    ID @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'User',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ID,
                ValueListProperty: 'ID',
            }, ],
            Label         : '{i18n>User ID}',
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.User with {
    ID @Common.Label: '{i18n>User ID}'
       @UI.HiddenFilter
};
