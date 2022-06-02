//
//  ViewController.swift
//  Checklists
//
//  Created by Ruby on 2022/5/31.
//

import UIKit

class ChecklistViewController: UITableViewController {
  var items = [ChecklistItem]()
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let item1 = ChecklistItem()
    let item2 = ChecklistItem()
    let item3 = ChecklistItem()
    let item4 = ChecklistItem()
    let item5 = ChecklistItem()
    
    item1.text = "Walk the dog"
    item2.text = "Hello"
    item3.text = "Write TypeScript"
    item4.text = "Write Swift"
    item5.text = "Watch WWDC"
    
    items.append(item1)
    items.append(item2)
    items.append(item3)
    items.append(item4)
    items.append(item5)
  }
  
  // MARK: - Table View Data Source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    let item = items[indexPath.row]
    
    configureText(for: cell, with: item)
    configureCheckmark(for: cell, with: item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    items.remove(at: indexPath.row)
    
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }
  
  func configureCheckmark(
    for cell:UITableViewCell,
    with item:ChecklistItem
  ){
    if item.checked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
  func configureText(
    for cell:UITableViewCell,
    with item:ChecklistItem
  ){
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = item.text
  }
  
  //MARK: - Table View Delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      let item = items[indexPath.row]
      item.checked.toggle()
      configureCheckmark(for: cell, with: item)
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  @IBAction func addItem(){
    let newRowIndex = items.count
    
    let item = ChecklistItem()
    
    item.text = "I'm a new Row"
    items.append(item)
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
  }
  
  
}

