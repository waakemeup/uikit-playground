//
//  Checklist.swift
//  Checklists
//
//  Created by Ruby on 2022/7/8.
//

import UIKit

class Checklist: NSObject,Codable {
  var name = ""
  var items = [ChecklistItem]()
  
  init(name:String) {
    self.name = name
    super.init()
  }
}
