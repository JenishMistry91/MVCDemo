//
//  APIEndpointsConstants.swift
//  MVCDemoAPI
//
//  Created by Jenish Mistry on 01/07/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Foundation

struct APIEndPointConstant {
    
    static let endpoint =  "http://dummy.restapiexample.com"
    
    //URLs
    static let baseURL = getBaseUrl()
    
    static func getBaseUrl() -> String {
        return endpoint
    }
}

