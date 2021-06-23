//
//  APIStatuses.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

struct APIStatusCodes{
    static let success = 0
    static let successWithNoData = 1
    static let AuthFailure = 2
}

struct APIResponseMessage{
    static let success = "SUCCESS"
    static let failure = "FAILURE"
    static let ok = "ok"
    static let error = "error"
}

struct APIContentAndKeys {
    static let contentValue = "application/json"
    static let contentKey = "Content-Type"
    static let authorizationKey = "Authorization"
    static let restrictAccess = "restrictAccess"
    static let restrictAccessValue = "false"
 }

