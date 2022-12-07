#Firebase with IOS



#####   Open firebase and  go to the console .

##### Add project and type name for your own project.

##### Choose your project and click on IOS icon

##### Apple bundle ID 

![alt text for screen readers](https://i.ibb.co/ZWTy55d/Screen-Shot-1444-05-13-at-10-39-49-AM.png).









 #####in the visual studio code   Runner folder -> Reval in finder 
 
![alt text for screen readers](https://i.ibb.co/ySKBZyg/Screen-Shot-1444-05-13-at-10-56-52-AM.png).
 
 
 #### —> runner.xcworkspace  —> move to Xcode ->
 ####--> copy bundle identifeir name and put it  in Apple bundle ID . And requisterApp.


##### Download ```GoogleService_info.plist``` check on the name 

>Back to Xcode and past or put the googleService-info.plist
	inside the Runner.:fa-share:

##### activate Copy items if needed .


##### back to visual studio code and open Podfile folder 

#####Activate first or second  line, remove the commment  ``` platform: iOS ’11:0’  ```


##### open terminal and write ``` Pod repo update ``` 

##### and type --> ```sudo gem install cocoapods.```

##### pod setup —> and write ``` flutter run ```

