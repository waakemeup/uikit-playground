//
//  AppCoordinator.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/4.
//

import UIKit

protocol Coordinator {
  var childCoordinators:[Coordinator] { get }
  func start()
}

final class AppCoordinator:Coordinator {
  private(set) var childCoordinators: [Coordinator] = []
  private let window:UIWindow
  
  init(window:UIWindow){
    self.window = window
  }
  
  func start() {
    let navigationController = UINavigationController()
    let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
    
    childCoordinators.append(eventListCoordinator)
    
    eventListCoordinator.start()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
}
