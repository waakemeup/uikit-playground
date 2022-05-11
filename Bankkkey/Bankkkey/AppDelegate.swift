//
//  AppDelegate.swift
//  Bankkkey
//
//  Created by Ruby on 2022/3/30.
//

import UIKit
import CoreData

let appColor:UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
//    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self

//        let vc = mainViewController
//        vc.setStatusBar()
//
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().backgroundColor = appColor
//
//        window?.rootViewController = vc
//
//        return true
        
        displayLogin()
        return true
    }
    
    private func displayLogin(){
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen(){
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
    
    private func prepMainView(){
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}

extension AppDelegate {
    func setRootViewController(_ vc:UIViewController,animated:Bool = true){
        guard animated,let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve,animations: nil,completion: nil)
    }
}


extension AppDelegate:LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

extension AppDelegate:OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate:LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

