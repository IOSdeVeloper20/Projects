# Clima - Mobile Weather App

Clima is a weather forecasting app. It allows users to check the weather based on their current location using the iPhone's GPS data, or they can manually search for the weather in any city. The app features a clean, dark-mode-enabled interface and utilizes the OpenWeather API to provide real-time weather data.

## Features

- **Current Weather Information**: Get up-to-date weather information based on your location or by manually searching for a city.
- **Dark Mode**: A dark mode theme for a comfortable viewing experience.
- **Weather Icons**: Displays weather conditions using intuitive vector icons.
- **Location Services**: Uses Core Location to fetch and display the current weather based on the user’s GPS.
- **Real-Time Data**: Fetches weather data from the OpenWeather API and updates live.

## What I Learned

- How to create a dark-mode-enabled app.
- How to use vector images as image assets.
- How to handle user input with `UITextField` and the delegate pattern.
- Understanding and using Swift protocols, extensions, and the `guard` keyword.
- How to use closures and completion handlers in Swift.
- How to use `URLSession` for network requests and parse JSON with Swift’s native `Encodable` and `Decodable` protocols.
- Understanding and utilizing `Grand Central Dispatch` to handle tasks on the main thread.
- How to get the current location of the user using the Core Location framework.


## Dependencies
- CoreLocation: To get the current location of the user.
- URLSession: For making network requests to the OpenWeather API.
- JSONDecoder: To parse the JSON response from the API.

## API
The app uses the OpenWeather API to fetch weather data.

## Example API Call
https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY&units=metric

(This API call returns weather data for the specified city (London). Replace YOUR_API_KEY with your actual API key.)
