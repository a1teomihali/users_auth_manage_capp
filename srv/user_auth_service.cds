using {user.mngr.db as my} from '../db/schema';

namespace user.mngr.srv;

service UserMngrService @(
    path    : '/usr-mngr',
    requires: 'UserAdmin'
) {

    //    @odata.draft.enabled
    entity User as projection on my.User;

}
