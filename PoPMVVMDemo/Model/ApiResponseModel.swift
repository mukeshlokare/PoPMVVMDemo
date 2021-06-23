//
//  ApiResponseModel.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

enum ApiResponse<T> {
    case success(value: T)
    case failure(error: Error)
}

struct ApiResponseModel<T : Codable>: Codable {
    
    var code : String?
    var status : String?
    var data : T?
    
    enum CodingKeys: String, CodingKey {
        case code = "statusCode"
        case status = "status"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.data = try container.decodeIfPresent(T.self, forKey: .data)
    }
}

struct ApiError: Codable {

    var message: String
    var documentationUrl: String
   
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case documentationUrl = "documentation_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        self.documentationUrl = try container.decodeIfPresent(String.self, forKey: .documentationUrl) ?? ""
        
    }
}
