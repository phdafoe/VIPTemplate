//  VIP.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

// MARK: - VIP

public protocol PresenterInterface: PresenterInteractorInterface {
    associatedtype InteractorPresenter
    var interactor: InteractorPresenter! { get set }
}

public protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor
    var presenter: PresenterInteractor! { get set }
}

public protocol EntityInterface {
    
}

// MARK: - Input/Ouput

public protocol PresenterInteractorInterface: class {
    
}

public protocol InteractorPresenterInterface: class {
    
}

// MARK: - Module

public protocol ModuleInterface {
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    func assemble(presenter: Presenter, interactor: Interactor)
}

public extension ModuleInterface {
    func assemble(presenter: Presenter, interactor: Interactor) {
        presenter.interactor = (interactor as? Self.Presenter.InteractorPresenter)
        interactor.presenter = (presenter as? Self.Interactor.PresenterInteractor)
    }
}
