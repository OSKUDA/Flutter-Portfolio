# Portfolio
Hi, I am **Oskar!**<br>
This repo holds Flutter applications developed by me during the course of ***learning*** & ***discovering*** flutter development. 
## rock_paper_scissors
>Android Studio (Flutter & Dart)

 <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/rock_paper_scissors/screenshot1.jpeg" width="180"/>  <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/rock_paper_scissors/screenshot2.jpeg" width="180"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/rock_paper_scissors/screenshot3.jpeg" width="180"/>
<img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/GIF/rock_paper_scissors/gif1.gif" width="180"/>
 
### Specifications
* A simple single page app
* Image placeholder responds to taps
* The taps/clicks update the ***state*** of ***Stateful Widgets***
* Keeps ***track*** of scores
### What I learned?
* Difference between ***Stateless*** and ***Stateful*** widgets
* Use ***builder methods*** efficiently to minimize code length
* Use Dart ***functions*** and basic libraries such as ***dart:math***

## weatherMe
>Android Studio (Flutter & Dart)

 <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-54-57-372_io.github.oskuda.weatherMe.jpg" width="200"/>  <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-53-21-407_io.github.oskuda.weatherMe.jpg" width="200"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-53-40-322_io.github.oskuda.weatherMe.jpg" width="200"/> <br>
<img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-53-46-755_io.github.oskuda.weatherMe.jpg" width="200"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-56-02-299_io.github.oskuda.weatherMe.jpg" width="200"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/weatherMe/Screenshot_2021-06-17-19-53-58-530_io.github.oskuda.weatherMe.jpg" width="200"/>
 
### Specifications
* App has multiple screen (splashScreen, weatherScreen, citySelectionScreen)
* App has two mode for weather data - location mode & city mode
* By default, weather for user's current location is fetched
* Users can search for specific city weather using citySelectionScreen
* Network and GPS location errors are handled properly
* API and GPS data calls are made in background thread
* Uses geolocator and geocoding for fetching user location
* Uses openweathermap api for weather data

### What I learned?
* create ***custom widget*** with dynamic properties and reuse it to ***reduce repetition of code***
* make use of ***constant.dart*** to store styling properties for clean code
* use ***asynchronous*** programming to download data over internet on background thread
* Integrate exception handling during downloads and parsing of data
* Integrate ***openweathermap*** API and learn about API architecture overall
* use ***Navigator & Routes*** to handle screen stack
* pass data from from screen to another and back
* ***validate*** data from api before processing it further
