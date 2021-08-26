//
//  DonationsApi.swift
//  TriumphSwiftTest
//
//  Created by Jared Geller on 8/25/21.
//

import Foundation
import FirebaseDatabase

class DonationsApi {
    
    // TODO: We aren't getting any donations from the database!
    func getMyDonations(completion: @escaping ([Donation]?) -> Void) {
        Database.database().reference().child("myDonations").child("uid1").observe(.value, with: {
            snapshot in
            
            var donations = [Donation]()
            
            if !snapshot.exists() {
                completion(donations)
            } else if let donationIdDict = snapshot.value as? [String: Bool] {

                for donationId in donationIdDict {
                    Database.database().reference().child("donations").child(donationId.key).observeSingleEvent(of: .value, with: {
                        snapshot in

                        if let donationData = snapshot.value as? [String: Any] {
                            let donation = Donation.transformDonation(dict: donationData, key: snapshot.key)
                            donations.append(donation)
                        }
                    })
                }
            }
            
            completion(donations)
        })
    }
    
    // TODO: Write function to increment the amount donated node under an organization with Id orgId by amount
    func addDonationToOrg(orgId: String, uid: String="uid1") {
    }
    
}
