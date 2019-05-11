//
//  FirebaseHelper.swift
//  ExtremeCoupon
//
//  Created by Christian Dobrovolny on 11.05.19.
//  Copyright © 2019 Christian Dobrovolny. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum FirebaseStrings {
    static let couponReference = "coupons"
}

enum FirebaseHelper {
    private static let databaseReference = Database.database().reference()
    static let couponReference = databaseReference.child(FirebaseStrings.couponReference)
    
    static func newEntry(for coupon: Coupon) -> Dictionary<String, AnyObject>{
        let coupon = [
            "title" : coupon.title as AnyObject,
            "date" : coupon.date as AnyObject,
            "code" : coupon.code as AnyObject
        ]
        
        return coupon
    }
    
    
    static func saveCoupon(_ coupon: Coupon) {
        let id = couponReference.childByAutoId()
        id.setValue(newEntry(for: coupon)) { (error, databaseReference) in
            if let error = error {
                print("ERROR: \(#function): \(error.localizedDescription)")
            }
        }
    }
}
