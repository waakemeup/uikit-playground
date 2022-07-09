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
  var iconName = "No Icon"
  
  init(name:String,iconName:String = "No Icon") {
    self.name = name
    self.iconName = iconName
    super.init()
  }
  
  func countUncheckedItems() -> Int{
    var count = 0
    for item in items where !item.checked {
      count += 1
    }
    return count
  }
}
