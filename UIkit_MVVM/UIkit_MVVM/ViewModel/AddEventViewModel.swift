//
//  AddEventViewModel.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/5.
//

import Foundation

final class AddEventViewModel {
  var coordinator:AddEventCoordinator?
  
  func viewDidDisappear(){
    coordinator?.didFinishAddEvent()
  }
  
  deinit {
    print("deinit from add event view model")
  }
}
