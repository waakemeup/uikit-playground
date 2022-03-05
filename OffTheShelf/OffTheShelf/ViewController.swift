//
//  ViewController.swift
//  OffTheShelf
//
//  Created by Ruby on 2022/3/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func experiment(){
        let controller = UIAlertController()
        
        controller.title = "Test Alert"
        controller.message = "This is a message"
        
        let okAction = UIAlertAction(title: "ok", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
    }
}

