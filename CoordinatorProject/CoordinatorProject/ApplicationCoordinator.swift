//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import SwiftUI
import UIKit
import Combine

class ApplicationCoordinator:Coordinator {
    let window:UIWindow
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window:UIWindow){
        self.window = window
    }
    
    func start() {
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardCoordinator.start()
                self?.childCoordinators = [onboardCoordinator]
                self?.window.rootViewController = onboardCoordinator.rootViewController
            }
        }
        .store(in: &subscriptions)
        
    }
    
    func setupOnboardingValue(){
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key)
        hasSeenOnboarding.send(true)
        
        hasSeenOnboarding
            .filter({$0})
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
    
}
