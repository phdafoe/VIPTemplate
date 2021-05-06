// ___VARIABLE_name___Module.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import SwiftUI

final class ___VARIABLE_name___Module: ModuleInterface {
    
    typealias ContentView = ___VARIABLE_name___View
    typealias Presenter = ___VARIABLE_name___Presenter
    typealias Interactor = ___VARIABLE_name___Interactor
    
    func build() -> ContentView {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = ContentView(viewModel: presenter)
        self.assemble(presenter: presenter, interactor: interactor)
        return view
    }
}

