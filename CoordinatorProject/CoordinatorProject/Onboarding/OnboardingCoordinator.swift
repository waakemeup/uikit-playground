//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by Ruby on 2022/5/3.
//

import Foundation
import SwiftUI
import Combine

class OnboardingCoordinator:Coordinator {
    
    var rootViewController = UIViewController()
    
    var hasSeenOnboarding:CurrentValueSubject<Bool,Never>
    
    init(hasSeenOnboarding:CurrentValueSubject<Bool,Never>){
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        
        rootViewController = UIHostingController(rootView: view)
    }
    
    
}
