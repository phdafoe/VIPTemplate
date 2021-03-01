//  MoviesModule.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import SwiftUI

// MARK: - module builder
final class MoviesModule: ModuleInterface {
    
    typealias View = MoviesView
    typealias Presenter = MoviesPresenter
    typealias Interactor = MoviesInteractor
    
    func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = View(viewModel: presenter)
        self.assemble(presenter: presenter, interactor: interactor)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
}
