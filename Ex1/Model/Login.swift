//
//  Login.swift
//  Ex1
//
//  Created by LozyLoop on 11/03/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import Foundation

struct Login: Encodable {
    let email: String
    let password: String
}

struct Token: Decodable {
    var accessToken: String?
    
    enum CodingKeys: String, CodingKey {
      case accessToken
    }
}

struct LoginResponse: Decodable {
    var status: Int? = 0
    var message: String? = ""
    var error: Int? = 0
    var data: Token?
    
    enum CodingKeys: String, CodingKey {
        case message = "message", error, status, data
    }
}
