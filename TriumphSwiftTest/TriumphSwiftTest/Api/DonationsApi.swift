//
//  DonationsApi.swift
//  TriumphSwiftTest
//
//  Created by Jared Geller on 8/25/21.
//

import Foundation
import FirebaseDatabase

class DonationsApi {
    
    func getMyDonations(completion: @escaping ([Donation]?) -> Void) {
        
        let dispatch = DispatchGroup()
        
        Database.database().reference().child("myDonations").child("uid1").observe(.value, with: {
            snapshot in
            
            var donations = [Donation]()
            
            if !snapshot.exists() {
                completion(donations)
            } else if let donationIdDict = snapshot.value as? [String: Bool] {

                for donationId in donationIdDict {
                    dispatch.enter()
                    Database.database().reference().child("donations").child(donationId.key).observeSingleEvent(of: .value, with: {
                        snapshot in

                        if let donationData = snapshot.value as? [String: Any] {
                            let donation = Donation.transformDonation(dict: donationData, key: snapshot.key)
                            donations.append(donation)
                        }
                        dispatch.leave()
                        
                    })
                }
            }
            
            dispatch.notify(queue: .main, execute: {
                completion(donations)
            })
        })
    }
    
    // TODO: Fill out
    func addDonationToOrg(orgId: String, amount: Double, uid: String="uid1") {
    }
    
}
