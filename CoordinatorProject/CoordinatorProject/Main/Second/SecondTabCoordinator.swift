//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import Foundation
import UIKit

class SecondTabCoordinator:Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController:SecondViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}

