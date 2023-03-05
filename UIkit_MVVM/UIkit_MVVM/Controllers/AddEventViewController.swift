//
//  AddEventViewController.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/5.
//

import UIKit

class AddEventViewController: UIViewController {
  var viewModel:AddEventViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    viewModel.viewDidDisappear()
  }
  
  deinit {
    print("deinit from add event view controller")
  }
  
}
