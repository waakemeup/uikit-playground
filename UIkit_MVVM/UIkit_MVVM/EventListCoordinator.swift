//
//  EventListCoordinator.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/4.
//

import UIKit

final class EventListCoordinator:Coordinator {
  private(set) var childCoordinators: [Coordinator] = []
  private let navigationController:UINavigationController
  
  init(navigationController:UINavigationController){
    self.navigationController = navigationController
  }
  
  func start() {
    let eventListViewController = EventListViewController.instantiate()
    navigationController.setViewControllers([eventListViewController], animated: false)
  }
  
  
}
