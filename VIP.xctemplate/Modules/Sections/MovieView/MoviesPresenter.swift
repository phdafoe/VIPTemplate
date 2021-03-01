//  MoviesPresenter.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MoviesPresenterInteractorInterface: PresenterInteractorInterface {
    func getDataArray(arrayResult: [ResultITunes]?)
}

final class MoviesPresenter: PresenterInterface, ObservableObject {

    @Published var arrayMovies: [ResultITunes] = []
    
    var interactor: MoviesInteractorPresenterInterface!
    
    func fetchData(){
        self.interactor.requestData()
    }
    
}

extension MoviesPresenter: MoviesPresenterInteractorInterface{
    func getDataArray(arrayResult: [ResultITunes]?) {
        self.arrayMovies = arrayResult ?? []
    }
}
