# Weather Screen Salesforce

A Salesforce Lightning Component for displaying weather information using the OpenWeather API.

## Project Overview

This project is a Lightning Component in Salesforce that fetches and displays real-time weather data from the OpenWeather API. Users can input a city name, and the component will display the current temperature, feels like, pressure, humidity and weather conditions for that city.

## Features

- **Weather Data**: Fetches temperature, weather conditions, and more from OpenWeather API.
- **City Search**: Users can enter a city name to view weather information.
- **Responsive UI**: Built using Lightning Web Components (LWC), designed to work on Salesforce Lightning Experience.

## Prerequisites

- **Salesforce Developer Org** or Sandbox.
- **API Key** from OpenWeather (sign up at [OpenWeather](https://openweathermap.org/api)).
- Basic knowledge of Salesforce Lightning Web Components (LWC) and Apex.
- Salesforce CLI installed on your local machine for deploying code.

## Setup Instructions

### Step 1: Get OpenWeather API Key
1. Go to [OpenWeather](https://openweathermap.org/api) and sign up.
2. Once registered, generate an API key.

### Step 2: Clone the Repository

  Clone the Weather Screen repository to your local machine:

      git clone https://github.com/poo56/weatherScreen.git
      cd weatherScreen 

### Step 3: Clone the Repository
1. Deploy the Apex Class: The WeatherDetailsClass Apex class handles the HTTP callout to the OpenWeather API. You'll need to deploy it to your Salesforce org.
2. Remote Site Settings:
   1. Go to Setup → Security → Remote Site Settings.
   2. Add a new Remote Site with the following details:
   3. Remote Site Name: OpenWeatherAPI
   4. Remote Site URL: http://api.openweathermap.org
   5. Active: Checked.

3. Set Up the Lightning Web Component:
    1. Deploy the LWC (Weather component) to your org.
    2. I have coded this in VS Code application.
    3. Pushing the folder using sfdx: deploy this source to Org.
4. Add the Weather Component to a Lightning Page:
   1. Go to Setup → App Builder → Create a new Lightning Page or modify an existing page.
   2. Drag and drop the weatherComponent onto the page.
   3. Save and activate the page.

### Step 4: Configure the Apex Class for Weather Details

1. Open the WeatherDetailsClass Apex class and ensure that it is configured to make a GET request to the OpenWeather API.
          
   Example:
          
          apex
   
          public class WeatherDetailsClass {
            @AuraEnabled
              public static String getWeatherDetails(String cityName) {
                  Http http = new Http();
                  HttpRequest req = new HttpRequest();
                  req.setEndpoint('http://api.openweathermap.org/data/2.5/weather?q=' + cityName + '&units=metric&APPID=YOUR_API_KEY');
                  req.setMethod('GET');
                  HttpResponse res = http.send(req);
                  return res.getBody();
            }
        }
        

Replace YOUR_API_KEY with the actual API key you received from OpenWeather.

  ### Step 5: Testing
  1. Navigate to the Lightning page where the weather component was added.
  2. Enter the name of a city in the input field.
  3. The component will display the weather information for the given city.
     
  
  
  ### Step 6: Customize (Optional)
  You can modify the LWC and Apex class to suit your needs:
  1. Customize the weather details displayed (e.g., add wind speed, humidity, etc.).
  2. Add styling to make the UI more attractive.
  3. Implement additional features, such as saving favorite cities.

 ## License
  This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing
1. Fork the repository.
2. Create a new branch (git checkout -b feature/my-feature).
3. Make your changes and commit them (git commit -am 'Add new feature').
4. Push to the branch (git push origin feature/my-feature).
5. Create a new Pull Request.

## Contact
Author:poo56

Email:poojitha.sre@gmail.com / poojithasreedhar5@gmail.com
