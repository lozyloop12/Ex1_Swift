//
//  Helper.swift
//  Ex1
//
//  Created by LozyLoop on 11/03/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import Foundation
import Alamofire

 var BaseURL = "http://15.188.14.215:3333/api/v1/";
 
class Helper {
    
    static func login(
        params: Login,
        callback: @escaping  () -> Void
    ){
        let request = AF.request(
            BaseURL + "sign-in",
            method: .post,
            parameters: params
        )
        request.responseJSON { (data) in
            guard let res = data.data else {
                return
            }
            do {
                let res_login = try JSONDecoder().decode(LoginResponse.self, from: res)
               callback()
                
            } catch {
                print("Error Decode")
            }
           
   
        }
    }
}


