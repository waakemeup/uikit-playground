//
//  UIViewController+Extensions.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/5.
//

import UIKit

extension UIViewController {
  static func instantiate<T>() -> T {
    let storyBoard = UIStoryboard(name: "Main",bundle: .main)
    let controller = storyBoard.instantiateViewController(withIdentifier: "\(T.self)") as! T
    return controller
  }
  
}
