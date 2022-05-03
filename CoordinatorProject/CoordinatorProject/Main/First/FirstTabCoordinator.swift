//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import Foundation
import UIKit
import SwiftUI

class FirstTabCoordinator:NSObject, Coordinator {
    var rootViewController:UINavigationController
    let viewModel = FirstTabViewModel()
    
    override init(){
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()
        
        rootViewController.delegate = self
    }
    
    lazy var firstViewController:FirstViewController  = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetail()
        }
        vc.title = "First Title"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetail(){
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}


extension FirstTabCoordinator:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController as? UIHostingController<FirstDetailView> != nil {
            print("detail will be shown")
        } else if viewController as? FirstViewController != nil {
            print("First will be shown")
        }
    }
}
