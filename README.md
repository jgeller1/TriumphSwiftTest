# TriumphSwiftTest
Are you up for the challenge? 

You are going to help debug and build functionality for our donation app. This will be a simple app that tracks your donations to various charitable organizations with friends. There is no strict time limit, but you should limit yourself to a few hours. 

# Steps: 

# 1. Setup 

Download the starter project. We .gitignore all Pod files, so be sure to run a "pod install" once cloned. 

The project has the following folders: 

1. ViewControllers: starting view controller
2. Models:

   We have three models: user, organization, and donation.
   
   A user object has a name, username, and id. 
   
   An organization argument has a name, amountGiven (the total amount the charity has ever raised), profilePhotoURL (a url string of a photo), and an id
   
   A donation object has a senderId (user id), a receiverId (organziation Id), an amount, a timestamp, and an Id.


3. TableViewCell: starting tableview cell that will be populated by a single donation object

4. Api: 

   Data layer that connects to the firebase realtime database and turns things into our model objects. Do not assume these all work as intended ;)

5. Supporting files: you shouldn't need anything here 


You can see the structure of our Firebase Real Time Database in database.json. Assume that the data in this json is the exact structure as in the realtime database. You have read, but not write, premissions to this database. You can assume that the database is correctly hooked up to the app. If you are unfamiliar with how to read from the firebase realtime database, use the below as a reference.

https://firebase.google.com/docs/database/ios/read-and-write

# 2. BrokenViewController

You can see that the singular view controller in our app is horrible. The developer intended to have a nice welcome message saying "Hi [name], you have donated $[amount] this year, along with a tableview with every cell showing a donation you made. You will fix this view controller. 


