//
//  User.swift
//  LenkilaUser
//
//  Created by Tanakorn on 7/28/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import Foundation
import Realm
class User:RLMObject{
    dynamic var id : String = ""
    dynamic var name : String  = ""
    dynamic var birthday : String = ""
    dynamic var gender : String = ""
    dynamic var work_place : String = ""
    dynamic var already_login : Bool = false
}
