//
//  ViewController.swift
//  Click Counter
//
//  Created by Ruby on 2022/3/4.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    }


    @IBAction func incrementCount(){
        self.count += 1
        self.label.text = "\(self.count)"
    }
}

