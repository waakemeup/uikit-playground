//
//  ViewController.swift
//  Checklists
//
//  Created by Ruby on 2022/5/31.
//

import UIKit

class ChecklistViewController: UITableViewController,ItemDetailViewControllerDelegate {
  var items = [ChecklistItem]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    navigationItem.largeTitleDisplayMode = .never
    
//    let item1 = ChecklistItem()
//    let item2 = ChecklistItem()
//    let item3 = ChecklistItem()
//    let item4 = ChecklistItem()
//    let item5 = ChecklistItem()
//
//    item1.text = "Walk the dog"
//    item2.text = "Hello"
//    item3.text = "Write TypeScript"
//    item4.text = "Write Swift"
//    item5.text = "Watch WWDC"
//
//    items.append(item1)
//    items.append(item2)
//    items.append(item3)
//    items.append(item4)
//    items.append(item5)
//
//    print("doucment folder is \(documentsDirectory())")
//    print("Data file path is \(dataFilePath())")
    
    loadChecklistItems()
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
    saveCheckListItems()
  }
  
  func configureCheckmark(
    for cell:UITableViewCell,
    with item:ChecklistItem
  ){
    let label = cell.viewWithTag(1001) as! UILabel
    
    if item.checked {
      label.text = "√"
    } else {
      label.text = ""
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
    saveCheckListItems()
  }
  
  // MARK: - Add Item ViewController Delegate
  func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
    navigationController?.popViewController(animated: true)
  }
  
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
    let newRowIndex = items.count
    items.append(item)
    
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    let indexPaths = [indexPath]
    tableView.insertRows(at: indexPaths, with: .automatic)
    navigationController?.popViewController(animated: true)
    
    saveCheckListItems()
  }
  
  func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
    if let index = items.firstIndex(of:item){
      let indexPath = IndexPath(row: index, section: 0)
      if let cell = tableView.cellForRow(at: indexPath) {
        configureText(for: cell, with: item)
      }
    }
    navigationController?.popViewController(animated: true)
    
    saveCheckListItems()
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddItem" {
      let controller = segue.destination as! ItemDetailViewController
      controller.delegate = self
    } else if segue.identifier == "EditItem" {
      let controller = segue.destination as! ItemDetailViewController
      controller.delegate = self
      
      if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
        controller.itemToEdit = items[indexPath.row]
      }
    }
  }
  
  func documentsDirectory() -> URL{
    let paths = FileManager.default.urls(
      for: .documentDirectory,
      in: .userDomainMask)
    return paths[0]
  }
  
  func dataFilePath() -> URL{
    return documentsDirectory().appendingPathComponent("Checklists.plist")
  }
  
  func saveCheckListItems(){
    let encoder = PropertyListEncoder()
    
    do {
      let data = try encoder.encode(items)
      
      try data.write(
        to: dataFilePath(),
        options: Data.WritingOptions.atomic
      )
    } catch {
      print("Error encoding item array: \(error.localizedDescription)")
    }
  }
  
  func loadChecklistItems(){
    let path = dataFilePath()
    
    if let data = try? Data(contentsOf: path) {
      let decoder = PropertyListDecoder()
      
      do {
        items = try decoder.decode(
          [ChecklistItem].self,
          from:   data)
      } catch {
        print("Error decoding item array: \(error.localizedDescription)")
      }
    }
  }
}

