//  MoviesInteractor.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MoviesInteractorPresenterInterface: InteractorPresenterInterface {
    func requestData()
}

final class MoviesInteractor: InteractorInterface {

    weak var presenter: MoviesPresenterInteractorInterface!
    var provider: MoviesProviderProtocol = MoviesProvider()
    
}

extension MoviesInteractor: MoviesInteractorPresenterInterface {
    func requestData() {
        self.provider.fetchDataFromWeb { (resultMovie) in
            self.presenter?.getDataArray(arrayResult: resultMovie.feed?.results)
        } failure: { (error) in
            print(error)
        }

    }
}


