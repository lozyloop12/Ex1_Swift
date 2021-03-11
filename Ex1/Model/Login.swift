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
//format Response
//{
//    "status": 200,
//    "data": {
//        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MTYwNjQ1NjMwMjgsImRhdGEiOnsic2NvcGVzIjpbXSwiaXNSZXZva2VkIjpmYWxzZSwiZGV2aWNlVG9rZW4iOm51bGwsIl9pZCI6IjYwNDlmNWIyODgxZTM3NWUxYjNjMTA5MSIsInVzZXJJZCI6IjVmYWNhODQyODdjMzlkMTA2YzRlZTczZSIsImVtYWlsIjoiY29uemludWFkYXUxMkBnbWFpbC5jb20iLCJpcCI6IjQyLjExNS4xNDguNDQiLCJkZXZpY2VJREZWIjoiamhzZGJmc2hqZGJmc2RoamsiLCJkZXZpY2VOYW1lIjoiU2Ftc3VuZyBHYWxheHkgTm90ZSAxMCIsImRldmljZVBsYXRmb3JtIjoiYW5kcm9pZCIsInR5cGUiOiJhcHAiLCJjcmVhdGVkQXQiOiIyMDIxLTAzLTExVDEwOjQ5OjIyLjk1M1oiLCJ1cGRhdGVkQXQiOiIyMDIxLTAzLTExVDEwOjQ5OjIyLjk1M1oiLCJfX3YiOjB9LCJpYXQiOjE2MTU0NTk3NjN9.IqPiTVpkVmZQz9vaDm6M8U9YNjdk4KdjJfB95B2TDts"
//    },
//    "message": "success",
//    "error": 0
//}
struct LoginResponse: Decodable {
//    var status: Int? = 0
    var message: String? = ""
//    var error: Int? = 0
// how to decodable field data,error,status
    
    enum CodingKeys: String, CodingKey {
//        case status
        case message = "message"
//        case status
    }
}
