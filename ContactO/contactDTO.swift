//
//  contactDTO.swift
//  ContactO
//
//  Created by JETS on 4/30/17.
//  Copyright © 2017 JETS. All rights reserved.
//

import Foundation

class contactDTO : NSObject, NSCoding {
    var email : String
    var phone : String
    var contactId : Int32
    var mobile : String
    var fullName : String
    init(email : String,phone : String,mobile : String,fullName : String,contactId : Int32){
        self.contactId=contactId
        self.email=email
        self.mobile=mobile
        self.phone=phone
        self.fullName=fullName
    }
    required init?(coder aDecoder: NSCoder) {
        self.email=aDecoder.decodeObjectForKey("email") as! String
        self.phone=aDecoder.decodeObjectForKey("phone") as! String
        self.mobile=aDecoder.decodeObjectForKey("mobile") as! String
        self.fullName=aDecoder.decodeObjectForKey("fullName") as! String
        self.contactId=aDecoder.decodeIntForKey("contactId") 
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.email, forKey: "email")
        aCoder.encodeObject(self.phone, forKey: "phone")
        aCoder.encodeObject(self.mobile, forKey: "mobile")
        aCoder.encodeObject(self.fullName, forKey: "fullName")
        aCoder.encodeInt(self.contactId, forKey: "contactId")
    }
}