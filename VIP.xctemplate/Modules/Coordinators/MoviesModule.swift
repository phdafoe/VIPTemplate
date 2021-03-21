//  MoviesModule.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import SwiftUI

// MARK: - module builder
final class MoviesModule: ModuleInterface {
    
    typealias ContentView = MoviesView
    typealias Presenter = MoviesPresenter
    typealias Interactor = MoviesInteractor
    
    func build() -> ContentView {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = ContentView(viewModel: presenter)
        self.assemble(presenter: presenter, interactor: interactor)
        return view
    }
}
