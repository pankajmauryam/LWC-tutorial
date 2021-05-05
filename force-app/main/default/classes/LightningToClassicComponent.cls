public class LightningToClassicComponent {
@AuraEnabled
    public static String getPageUrlMethod(String pageURL)
    {
        String url =  pageURL + '/ltng/switcher?destination=classic&referrer=%2Flightning%2Fsetup%2FSetupOneHome%2Fhome';
        system.debug('test--'+ url);
        return url;
    }
}