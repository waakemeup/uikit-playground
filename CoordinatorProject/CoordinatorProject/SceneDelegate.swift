//
//  SceneDelegate.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowSence = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowSence)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }
}

