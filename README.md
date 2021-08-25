# TriumphSwiftTest
Are you up for the challenge? 

You are going to help debug and build functionality for our donation app. This will be a simple app that tracks your donations to various charitable organizations with friends. There is no strict time limit, but you should limit yourself to a few hours. 

# Steps: 

# 1. Setup 

Download the starter project. We .gitignore all Pod files, so be sure to run a "pod install" once cloned. 

The project has the following folders: 

1. ViewControllers: 

   Starting view controller
   
2. Models:

   We have three models: user, organization, and donation.
   
   A user object has a name, username, and id. 
   
   An organization argument has a name, amountGiven (the total amount the charity has ever raised), profilePhotoURL (a url string of a photo), and an id
   
   A donation object has a senderId (user id), a receiverId (organziation Id), an amount, a timestamp, and an Id.


3. TableViewCell: 
   
   Starting tableview cell that will be populated by a single donation object. 

4. Api: 

   Data layer that connects to the firebase realtime database and turns things into our model objects. Do not assume these all work as intended ;)

5. Supporting files: 

   You shouldn't need anything here 


You can see the structure of our Firebase Real Time Database in database.json. Assume that the data in this json is the exact structure as in the realtime database. You have read, but not write, premissions to this database. You can assume that the database is correctly hooked up to the app. If you are unfamiliar with how to read from the firebase realtime database, use the below as a reference. 

Your user id is "uid1".

https://firebase.google.com/docs/database/ios/read-and-write

# 2. BrokenViewController

You can see that the singular view controller in our app is horrible. The developer intended to have a nice welcome message saying

"Hi [name], you have donated $[amount] this year"

along with a tableview below it with every cell showing a donation you made. A few obvious issues: the message is displaying nil for both the name and amount donated and our tableview is not being populated with anything! 

1. Have the starting message populate with the user's **first** name. You can use the function in Api/User/getUser to get the entire user JSON from the database (assume this works).

2. In viewDidLoad, we clearly make a call to populate the donations array with donation objects and reload the tableview, yet nothing is happening. Something must be up with that function. Investigate. 

3. Now the tableview is populated, but our cell is messed up. Go into TableViewCells/MyDonationTableViewCell and make sure the amount and user's name are correctly shown. 

4. This is better, but still not easy on the eyes. Too much text. Notice that in MyDonationTableViewCell, we have an imageview named profileImageView. We want to populate this with the image from the profile photo of the organization we donated to. Install the pod **SDWebImage** and populate the imageview with the correct profile photo. 

Hint: the donation object in each cell holds a "receiverId" object that maps to an organization (see the database json). Follow the paradigm in the other Api files and build a function to get an organization's url from its id, and pass the url you get to a function in SDWebImage. 

5. Now we can fix the rest of the starting message by showing the total amount donated. This should be the sum of all donations that you've made. Use a property observer and functional programming (map, reduce, etc.) to compute this dynamically. 

6. Our view controller looks presentable! The only issue is that we dont want the screen to display until everything has loaded propertly. Use the **SwiftSpinner** cocoapod loading indicator and DispatchQueue to make the spinner show until all data has been loaded.


