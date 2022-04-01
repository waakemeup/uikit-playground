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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankeyyy is faster!!! easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")

        return true
    }
}

