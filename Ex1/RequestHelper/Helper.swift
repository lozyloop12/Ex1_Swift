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
 var token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MTYyMjYyOTQzOTcsImRhdGEiOnsic2NvcGVzIjpbXSwiaXNSZXZva2VkIjpmYWxzZSwiZGV2aWNlVG9rZW4iOm51bGwsIl9pZCI6IjYwNGM2ZDc2ZjI4MDJlMDI5M2JjMjIxNyIsInVzZXJJZCI6IjYwMDI5NzU0NjhkNDNhMDZkNTUwODg2YyIsImVtYWlsIjoiQWFhYTEyQGdtYWlsLmNvbSIsImlwIjoiNDIuMTE2Ljk4LjExMyIsInR5cGUiOiJhcHAiLCJjcmVhdGVkQXQiOiIyMDIxLTAzLTEzVDA3OjQ0OjU0LjM2MFoiLCJ1cGRhdGVkQXQiOiIyMDIxLTAzLTEzVDA3OjQ0OjU0LjM2MFoiLCJfX3YiOjB9LCJpYXQiOjE2MTU2MjE0OTR9.dovMlTITcHoz5-Ggs6oWZfr4n7AdipSf7VbFx1QfpR0"

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
    
    static func getListArticle(callback: @escaping (_ data: BrandResponse) -> Void) {
         let request = AF.request(
                   BaseURL + "article/recently-added",
                   method: .get,
                   headers: ["Authorization": token]
               )
               request.responseJSON { (data) in
                   guard let res = data.data else {
                       return
                   }
                   do {
                      let res_article = try JSONDecoder().decode(BrandResponse.self, from: res)
                    callback(res_article)
                   } catch {
                       print("Error Decode Article")
                   }
                
               }
    }
}


