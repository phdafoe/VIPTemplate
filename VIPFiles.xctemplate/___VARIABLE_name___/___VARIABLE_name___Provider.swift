// ___VARIABLE_name___Provider.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ___VARIABLE_name___ProviderProtocol {
    
}

class ___VARIABLE_name___Provider: ___VARIABLE_name___ProviderProtocol {

    private let dataService = BaseProvider()
    
    internal func fetchDataFromWeb(_ completion: @escaping (MoviesEntity) -> (), failure: @escaping(APIError) -> ()) {

        ///Example call webservice
        /*let providerRD = RequestData(params: nil, method: .get, urlContext: .webService, endpoint: URLEndpoint.moviesApple)
        
        self.dataService.request(request: providerRD,
                                 entityClass: MoviesEntity.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }*/
    }
}


