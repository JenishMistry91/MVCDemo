//
//  WebService.swift
//  MVCDemoAPI
//
//  Created by Jenish Mistry on 01/07/20.
//  Copyright © 2020 Jenish Mistry. All rights reserved.
//

import Alamofire
import Moya

class WebService: Alamofire.Session {
    static let sharedManager: WebService = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = HTTPHeaders.default
        configuration.timeoutIntervalForRequest = APIConstants.apiTimeOut // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = APIConstants.apiTimeOut // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return WebService(configuration: configuration)
    }()
}
