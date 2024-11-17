public class WeatherDetailsClass {
    
    public static WeatherDetailsWrapper getWeatherDetails(String cityName){
        //Frame the EndPoint URL
        @AuraEnabled
        String apiKey = '47b7f9848a1beb0c904ab8ee2b3567be';
        String endpoint = 'http://api.openweathermap.org/data/2.5/weather';
        endpoint += '?q='+cityName;
        endpoint += '&units=metric';
        endpoint += '&APPID=' +apiKey;
        system.debug('endPoint URL' + endpoint);
        
        // Step in Creating Http and HttpRequest Objects
        // call out to the weather API
        Http http = new http(); //initializes the HTTP object to send requests.
        HttpRequest req = new HttpRequest(); //initializes the HTTP request object.
        
        //Step 2 . Setting EndPoint and Method
        req.setEndPoint(endpoint); //sets the URL (endpoint) where the request will be sent
        req.setMethod('GET');
        
        //Step 3: Sending the request
        HttpResponse res = http.send(req); //Sends the HTTP request and gets the response
        system.debug('res' + res +' body '+ JSON.deserializeUntyped(res.getBody()));
        
        
        //return the weather details in wrapper form
        
        WeatherDetailsWrapper weatherDet = new WeatherDetailsWrapper();
        if(res.getStatusCode() == 200){
            Map<String,object> result = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
            weatherDet.city = String.valueOf(result.get('name'));
            Map<String,object> mainResult = (Map<String,object>)(result.get('main'));
            weatherDet.temperature = String.valueOf(mainResult.get('temp'));
            weatherDet.pressure = String.valueOf(mainResult.get('pressure'));
            weatherDet.humidity = String.valueOf(mainResult.get('humidity'));
            weatherDet.feelsLike = String.valueOf(mainResult.get('feels_like'));
            weatherDet.tempMin = String.valueOf(mainResult.get('temp_min'));
            weatherDet.tempMax = String.valueOf(mainResult.get('temp_max'));
        }
        system.debug('weather details to return=> '+weatherDet);
        return weatherDet;
            
        }
        
    
    public class WeatherDetailsWrapper {
        @AuraEnabled public String city {get;set;}
        @AuraEnabled public String temperature {get;set;}
        @AuraEnabled public String pressure {get;set;}
        @AuraEnabled public String humidity {get;set;}
        @AuraEnabled public String feelsLike {get;set;}
        @AuraEnabled public String tempMin {get;set;}
        @AuraEnabled public String tempMax {get;set;}
    }

}