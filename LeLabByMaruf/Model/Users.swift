//
//  Users.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import Foundation

class Users {
    
    var id : Int? = nil
    var name : String? = nil
    var username : String? = nil
    var email : String? = nil
    var address : Address? = nil
    var phone : String? = nil
    var website : String? = nil
    var company : Company? = nil
    
    init() {
    }
    
    init(_ dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        username = dictionary["username"] as? String
        email = dictionary["email"] as? String
        if (dictionary["address"] != nil) {  }
        address = Address(dictionary: dictionary["address"] as? NSDictionary ?? NSDictionary())
        phone = dictionary["phone"] as? String
        website = dictionary["website"] as? String
        company = Company(dictionary: dictionary["company"] as? NSDictionary ?? NSDictionary())
    }
    
    static func getModelArray(_ array: [NSDictionary]) -> [Users] {
        var result = [Users]()
        for item in array {
            result.append(Users(item))
        }
        
        return result
    }
}

struct Company  {

    let name : String?
    let catchPhrase : String?
    let bs : String?

    init(dictionary: NSDictionary) {

        name = dictionary["name"] as? String
        catchPhrase = dictionary["catchPhrase"] as? String
        bs = dictionary["bs"] as? String
    }
}

struct Address {
    
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    
    init(dictionary: NSDictionary) {

        street = dictionary["street"] as? String
        suite = dictionary["suite"] as? String
        city = dictionary["city"] as? String
        zipcode = dictionary["zipcode"] as? String
    }
}

