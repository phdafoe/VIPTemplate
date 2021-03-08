//
//  Created on ___DATE___.
// subfolder/Filename.swift - Very brief description
//
// This source file is part of the everis open source project in iOS Desktop
//
// Copyright (c) 2020 EVERIS Sl. and the Swift project authors iOS Desktop
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://steps.everis.com/git/MOVILIDAD/architecture-swiftui-ios/-/blob/master/README.md for text information
//
// -----------------------------------------------------------------------------
///
/// This file contains stuff that I am describing here in the header and will
/// be sure to keep up to date.
///
// -----------------------------------------------------------------------------

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


