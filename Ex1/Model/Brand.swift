//
//  Brand.swift
//  Ex1
//
//  Created by LozyLoop on 23/02/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import Foundation

struct Brand {
    var category: String?
    var description: String?
    var cost: Float?
}

struct Article: Decodable {
    var category: String?
    var subCategory: String?
    var price: Float?
    var images: [String]
    
    enum CodingKeys: String, CodingKey {
        case category, subCategory, price, images
    }
}

struct ListArticle: Decodable {
    var data: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct BrandResponse: Decodable {
    var data: ListArticle?
    var status: Int? = 0
    var message: String? = ""
    var error: Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case data, status, message, error


    }
}
