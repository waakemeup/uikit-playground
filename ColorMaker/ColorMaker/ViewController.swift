//
//  ViewController.swift
//  ColorMaker
//
//  Created by Ruby on 2022/3/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView:UIView!
    @IBOutlet weak var redControl:UISwitch!
    @IBOutlet weak var greenControl:UISwitch!
    @IBOutlet weak var blueControl:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:action
    @IBAction func changeColorComponent(){
        if self.redControl == nil {
            return
        }
        
        let r:CGFloat = self.redControl.isOn ? 1 : 0
        let g:CGFloat = self.greenControl.isOn ? 1 : 0
        let b:CGFloat = self.blueControl.isOn ? 1 : 0
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        colorView.layer.borderWidth = CGFloat(4)
        colorView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }

}

