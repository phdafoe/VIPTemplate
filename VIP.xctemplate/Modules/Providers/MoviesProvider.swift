//  MoviesProvider.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MoviesProviderProtocol {
    func fetchDataFromWeb(_ completion : @escaping (MoviesEntity) -> (), failure : @escaping(APIError) -> ())
}

class MoviesProvider: MoviesProviderProtocol {
    
    private let dataService = BaseProvider()
    
    internal func fetchDataFromWeb(_ completion: @escaping (MoviesEntity) -> (), failure: @escaping(APIError) -> ()) {

        let providerRD = RequestData(params: nil, method: .get, urlContext: .webService, endpoint: URLEndpoint.moviesApple)
        
        self.dataService.request(request: providerRD,
                                 entityClass: MoviesEntity.self) { [weak self] (result) in
            guard self != nil else { return }
            if let resultDes = result {
                completion(resultDes)
            }
        } failure: { (error) in
            failure(error)
        }
    }
}
