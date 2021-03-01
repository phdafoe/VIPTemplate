//  SceneModule.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import SwiftUI

protocol SceneModuleProtocol : class {
    func applicationShowInitVC(_ window : UIWindow, scene: UIScene)
}

final class SceneModule: SceneModuleProtocol{
    
    private(set) var window: UIWindow?
    
    internal func applicationShowInitVC(_ window : UIWindow, scene: UIScene) {
        window.rootViewController = MoviesModule().build()
        self.window = window
        window.makeKeyAndVisible()
    }
}
