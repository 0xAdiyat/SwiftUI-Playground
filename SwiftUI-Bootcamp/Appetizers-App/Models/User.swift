//
//  User.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 19/1/24.
//

import SwiftUI

struct User: Codable{
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
