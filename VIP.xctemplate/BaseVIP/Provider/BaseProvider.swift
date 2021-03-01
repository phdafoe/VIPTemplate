//  BaseProvider.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

class BaseProvider {
    
    var manager = RequestManager()
    
    internal func request<T:Decodable>(request: RequestData,
                                       timeout: TimeInterval = 15,
                                       printLog: Bool = true,
                                       encrypted: Bool = false,
                                       additionalHeader: [ String: String] = [:],
                                       entityClass : T.Type,
                                       success: @escaping(T?) -> Void,
                                       failure: @escaping(APIError) -> Void) {
        
        self.manager.request(request: request,
                             timeout: timeout,
                             printLog: printLog,
                             encrypted: encrypted,
                             additionalHeader: additionalHeader,
                             entityClass: entityClass) { [weak self] (result) in
            
            guard self != nil else { return }
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure((error as NSError) as! APIError)
            }
        }
    }
}
