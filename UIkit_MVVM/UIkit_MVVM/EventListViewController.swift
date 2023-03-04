//
//  EventListViewController.swift
//  UIkit_MVVM
//
//  Created by Ruby on 2023/3/4.
//

import UIKit

class EventListViewController: UIViewController {
  static func instantiate() -> EventListViewController {
    let storyBoard = UIStoryboard(name: "Main",bundle: .main)
    let controller = storyBoard.instantiateViewController(withIdentifier: "EventListViewController") as! EventListViewController
    return controller
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews(){
    let plusImage = UIImage(systemName: "plus.circle.fill")
    let barButtonItem = UIBarButtonItem(image:plusImage , style: .plain, target: self, action: #selector(tappedRightBarButton) )
    
    barButtonItem.tintColor = .primary
    
    navigationItem.rightBarButtonItem = barButtonItem
    navigationItem.title = "Events"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  @objc private func tappedRightBarButton(){
    print("tapped right bar button")
  }
  
  
}
