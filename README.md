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
#### *created an app to fetch and display weather data*
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
* pass data from from one screen to another and back
* ***validate*** data from api before processing it further


## myGroup
#### *created an app for group chats*
>Android Studio (Flutter & Dart)

 <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-20-54-400_io.github.oskuda.my_group.jpg" width="250"/>  <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-22-03-375_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-23-56-456_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-23-19-165_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-24-26-627_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-54-49-564_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-54-58-782_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-17-55-25-931_io.github.oskuda.my_group.jpg" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myGroup/Screenshot_2021-07-11-18-20-47-856_io.github.oskuda.my_group.jpg" width="250"/> 

 
### Specifications
* App has multiple screen (splashScreen, authenticationScreen, dashboardScreen, messageScreen)
* Users can register using email and password
* Users can create or join existing group chats
* FirebaseAuth is used for user authentication
* Firestore is used as the backend
* Implements MVC architecture
* Provider is used for state management
* Message updates on real-time
* Only the admin of the group can delete the chat
* Only authenticated users can read/write messages
* Alert dialog are used to warm users of errors
* App is scalable

### What I learned?
* Use and manage widget states using ***provider package***
* ***lifting the state*** up the widget tree
* work with implenting ***callbacks***
* implement proper ***auth flow***
* write ***Firestore rules***
* make app scalable and moduler using ***MVC architecture***
* efficient ***data modelling*** for Firestore
* go from hand drawn ***wireframe to full functioning*** application
* minimize code repetition by ***modulerizing*** widgets

## myTimer
#### *an app to track time*
>(Flutter, Dart & BLoc)

 <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myTimer/1.png" width="250"/>  <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myTimer/2.png" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myTimer/3.png" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myTimer/4.png" width="250"/> <img src="https://github.com/OSKUDA/Flutter-Portfolio/blob/main/Screenshots/myTimer/state.png" width="500"/> 

 
### Specifications
* App has two modes: i) timer ii) stopwatch
* Uses ***BLoC state management*** under the hood
* Users can record lap timings
* Implements ***clean architecture*** with minimum inter dependencies
* App is ***scalable*** and functions are highly ***portable***

### What I learned?
* Familiarized with BLoc state management and design pattern
* Working of ***stream and subscription***
* Abstracting **states** and ***events*** of a feature
* Working with ***Equatable*** for ease of comparing objects
