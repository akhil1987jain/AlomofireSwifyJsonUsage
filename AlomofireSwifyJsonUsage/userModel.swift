
//  userModel.swift
//  AlomofireSwifyJsonUsage
//
//  Created by Akhil on 30/03/19.
//  Copyright © 2019 Akhil. All rights reserved.


import Foundation
import SwiftyJSON

class userModel{
    var name: String?
    var email:String?
    var phone:String?
    var address: addressModel?
    var company: companyModel?
    init(userJson:JSON) {
        self.name = userJson["name"].stringValue
        self.email = userJson["email"].stringValue
        self.phone = userJson["phone"].stringValue
        self.address = addressModel(addressJson: userJson["address"])
        self.company = companyModel(companyJson: userJson["company"])
    }
}

class addressModel {
    var street: String?
    var city: String?
    init(addressJson:JSON) {
        self.street = addressJson["street"].stringValue
        self.city = addressJson["city"].stringValue
    }
}

class companyModel{
    var catchPhase: String?
    init(companyJson:JSON) {
        self.catchPhase = companyJson["catchPhrase"].stringValue
    }
}
