sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/userauthmanagement/test/integration/FirstJourney',
		'ns/userauthmanagement/test/integration/pages/UserList',
		'ns/userauthmanagement/test/integration/pages/UserObjectPage'
    ],
    function(JourneyRunner, opaJourney, UserList, UserObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/userauthmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUserList: UserList,
					onTheUserObjectPage: UserObjectPage
                }
            },
            opaJourney.run
        );
    }
);