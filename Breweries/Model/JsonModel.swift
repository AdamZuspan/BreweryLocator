//
//  JsonModel.swift
//  Breweries
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import Foundation
import SwiftyJSON
import Kingfisher


struct JsonModel {
    var state: String = ""
    var city: String = ""
    var company: String = ""
    var longitude: String = ""
    var latitude: String = ""
    var brewType: String = ""
    var postalCode: String = ""
    var country: String = ""
    var phoneNumber: String = ""
    var websiteUrl: String = ""
    var whenLastUpdate: String = ""
    
    init() {}
    
    init(json: JSON) {
        state = json["state"].stringValue
        city = json["city"].stringValue
        company = json["name"].stringValue
        longitude = json["longitude"].stringValue
        latitude = json["latitude"].stringValue
        brewType = json["brewery_type"].stringValue
        postalCode = json["postal_code"].stringValue
        country = json["country"].stringValue
        phoneNumber = json["phone"].stringValue
        websiteUrl = json["website_url"].stringValue
        whenLastUpdate = json["updated_at"].stringValue

    }
}
