// ___VARIABLE_name___Presenter.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ___VARIABLE_name___PresenterInteractorInterface: PresenterInteractorInterface {
    
}

final class ___VARIABLE_name___Presenter: PresenterInterface, ObservableObject {

    // MARK: VIPER Dependencies
    var interactor: ___VARIABLE_name___InteractorPresenterInterface!
    
    // MARK: Private Functions
    func viewDidLoad() {
        
    }
}

extension ___VARIABLE_name___Presenter: ___VARIABLE_name___PresenterInteractorInterface {

}
