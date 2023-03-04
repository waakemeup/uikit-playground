//
//  SceneDelegate.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/4.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var appCoordinator: AppCoordinator?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let sence = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: sence)
    self.window = window
    
    self.appCoordinator = AppCoordinator(window: window)
    appCoordinator?.start()
  }


}

