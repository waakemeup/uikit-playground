//
//  AppDelegate.swift
//  Bankkkey
//
//  Created by Ruby on 2022/3/30.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        
        window?.rootViewController = onboardingContainerViewController
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankeyyy is faster!!! easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")

        return true
    }
}

extension AppDelegate:LoginViewControllerDelegate {
    func didLogin() {
        print("foo - Did login")
    }
}


extension AppDelegate:OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("foo - Did onboard")
    }
}
