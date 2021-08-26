# TriumphSwiftTest
Are you up for the challenge? 

You are going to help debug and build functionality for our donation app, a simple app that tracks your donations to various charitable organizations with friends. There is no strict time limit, but you should limit yourself to a few hours unless you are feeling inspired to do more. Assume functions may not work as intended unless specified.

# Steps: 

# 1. Setup 

Download the starter project. We **.gitignore** all Pod files, so be sure to run a "pod install" once cloned. 

The project has the following folders: 

**1. ViewControllers:** 


   Has the starting view controller, **BadViewController**
   
   
**2. Models:**



   We have three models: **user**, **organization**, and **donation**.
   
   A **user** object has a **name**, **username**, and **id**. 
   
   An **organization** object has a **name**, **amountGiven** (the total amount the charity has ever raised), **profilePhotoURL** (a url string of a photo), and an **id**
   
   A **donation** object has a **senderId** (user id), a **receiverId** (organziation Id), an **amount**, a **timestamp**, and an **Id**.

   **You can assume there are no errors in the model objects.**

**3. TableViewCell:**
   
   
   Starting tableview cell that will be populated by a single donation object. 
   

**4. Api:** 


   Data layer that connects to the firebase realtime database and turns things into our model objects.
   

**5. Supporting files:**


   You shouldn't need anything here 


**Critical:**


You can see the structure of our Firebase Real Time Database in database.json. **Assume that the data in this json is the exact structure as in the realtime database.** You have read, but not write, premissions to this database. You can assume that the database is correctly hooked up to the app. If you are unfamiliar with how to read from the firebase realtime database, use the below as a reference. 

https://firebase.google.com/docs/database/ios/read-and-write


**Note: assume you are logged in as an authenticated user with uid "uid1"**


# 2. BrokenViewController



You can see that the singular view controller in our app is horrible. The developer intended to have a nice welcome message saying

"Hi [name], you have donated $[amount] this year"

along with a tableview below it with each cell showing a donation you made. A few obvious issues: the message displays nil for both the name and amount donated and our tableview is not being populated with anything! 

1. Have the starting message populate with the user's **first** name. You can use the function in **Api/User/getUser** to get the entire user JSON from the database and assume this function works.

2. In viewDidLoad, we clearly make a call to populate the donations array with donation objects and reload the tableview, yet nothing is happening. Something must be up with that function. Investigate. You can assume that the Donation model works. 

3. Now the tableview is populated, but our cell looks messed up. Go into **TableViewCells/MyDonationTableViewCell** and make sure the donation amount and user's name are correctly shown. 

4. This is better, but still not easy on the eyes. Too much text. Notice that in MyDonationTableViewCell, we have an imageview named profileImageView. We want to populate this with the image from the profile photo of the organization we donated to. Install the pod **SDWebImage** and populate the imageview with the correct profile photo. 

**Hint:** the donation object in each cell holds a "receiverId" string that maps to an organization (see the database json). Follow the paradigm in the other Api files and build a function to get an organization's url from its id, and pass the url you get to a function in SDWebImage. Remember, you have full write access.

**Hint:** Images and tableviews are finnikey. Do your best with loading the images in a smooth way. 

**Extra (difficult):** There is a timestamp attached to each donation. The value is from a call to javascript's **Date.now()**. Sort the array so the newest donations display first and add a textfield showing the date of the donation in a human readable form. 

5. Now we can fix the rest of the starting message by showing the total amount donated. This should be the sum of all donations that you've made. Use a property observer and functional programming (map, reduce, etc.) to compute this dynamically from the array of donations you've made.

6. Our view controller looks presentable! The only issue is that we dont want the screen to display until everything has loaded propertly. Use the **SwiftSpinner** cocoapod loading indicator and DispatchQueue to make the spinner show until all data has been loaded and the asynchronous calls are complete.

7. Rename BadViewController() to GoodViewController() 😊

# 3. DonationViewController



We want to improve our app to multiple pages now. Restructure the app so that it is controlled by a **TabBarController** with two tabs. The first being the view controller you just worked on, and the second being a new collection view controller that you will create. Just as in the last view controller, handle asynchronous loading by showing a **SwiftSpinner**. 

**Important: Do this entirely programtically. Triumph hates Storyboards**

1. Add a tab bar with the tabs set as the GoodViewController() and a new view controller. 

2. Create a custom CollectionViewCell and hook it up **programatically** to the view controller in the second tab. The collectionView should be the only element on the page, and constrained to the entire bounds of the screen. It should scroll vertically. Each cell should be wide enough to fit two in each row. 

3. Populate one cell for every charity organization. The function **getOrganizationFromId** in **Api/OrganizationApi** loads an organization from a given orgId. You can assume this is correct. Can you modify this to return all organizations from the database? Note: this should show all organizations, even ones you have not donated to.

4. Each cell should display its organization name, amount raised, and a photo with the profilePhotoURL (reuse your code from earlier). You can choose how to best display these. 

5. Finally, add a button to each cell that says Donate. When tapped, the button should bring up an ActionSheet prompting the user to donate an amount of 1$, 5$, 10$, or $100. On tapping, you should call the function **addDonationToOrg** in **Api/DonationsApi/**. 

6. Fill out the function **addDonationToOrg** in **Api/DonationsApi/** to increase the amountGiven field by the amount the user clicked. You have special write premission to this node. Do not worry about adding the donation to the "myDonations" or "donations" node (this is an anon donation). To ensure concurency, use a client side firebase Transaction to update the data, which you can read about here.

https://firebase.google.com/docs/firestore/manage-data/transactions#swift

# 3. To the moon 🚀

1. If you've made it here, well done. Theres nothing left to do from me. If you're not satisfied yet, feel free to show off. Excited to see what you come up with (by no means mandatory).


