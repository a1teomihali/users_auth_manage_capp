namespace user.mngr.db;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity User : cuid {
    @title: 'Username'
    userName       : String(20) @mandatory;

    @title: 'BTP Sequence'
    btpId          : String(15);

    @title: 'External ID'
    externalId     : String(15)  @mandatory;

    @title: 'First Name'
    firstName      : String(20);

    @title: 'Last Name'
    lastName       : String(20);

    @title: 'Full Name'
    displayName    : String(40) @mandatory;

    @title: 'User Mail'
    eMail          : String(30) @mandatory;

    @title: 'User IdP ID'
    @UI.HiddenFilter
    origin         : Association to one IdP;

    @title: 'User Authorizations'
    authorizations : Composition of many UserAuthorization
                         on authorizations.parent = $self;

    @title: 'User IsActive'
    isActive       : Boolean;

    @title: 'User IsVerified'
    isVerified     : Boolean;
}

entity UserAuthorization : managed {
        @title: 'User Auth Parent'
    key parent        : Association to one User;

        @title: 'User Authorization'
    key authorization : Association to one Authorization;
}

@readonly
@cds.autoexpose
entity IdP : cuid, managed {
    @title: 'IdP Name'
    name : String(30);
}

@cds.autoexpose
entity Authorization : cuid, managed {
    @title: 'Authorization Name'
    name        : String(50);

    @title: 'Authorization Description'
    description : String(50);
}
