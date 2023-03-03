//
//  ViewController.swift
//  InsClone
//
//  Created by Ruby on 2023/3/3.
//

import UIKit

class ViewController: UIViewController {
  
  var collectionView:UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
    
    configureCollectionView()
  }
  
  private func configureCollectionView(){
    let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
    
    view.addSubview(collectionView)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "header")
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "story")
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "feed")
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    
    self.collectionView = collectionView
  }
  
  private func createFlowLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnv in
      if sectionIndex == 0 {
        return self.createHeaderLayout()
      } else if sectionIndex == 1{
        return self.createStoryLayout()
      } else {
        return self.createFeedLayout()
      }
    }
    return layout
  }
  
  private func createHeaderLayout() -> NSCollectionLayoutSection{
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
    let headerItem = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
    let headerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: headerItem, count: 1)
    
    let headerSection = NSCollectionLayoutSection(group: headerGroup)
    return headerSection
  }
  
  private func createStoryLayout() -> NSCollectionLayoutSection{
    let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(64), heightDimension: .absolute(64))
    let storyItem = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(80))
    let storyGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: storyItem, count: 1)
    
    let storySection = NSCollectionLayoutSection(group: storyGroup)
    storySection.orthogonalScrollingBehavior = .continuous
    
    return storySection
  }
  
  private func createFeedLayout() -> NSCollectionLayoutSection{
    let postHeaderItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
    let postImageItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
    let postActionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
    let postCaptionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35)))
    let postCommentSectionItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
    
    let feedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [postHeaderItem,postImageItem,postActionItem,postCaptionItem,postCommentSectionItem])
    
    let feedSection = NSCollectionLayoutSection(group: feedGroup)
    return feedSection
  }
  
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return 8
    } else {
      return 5
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "header", for: indexPath)
      
      cell.backgroundColor = .cyan
      return cell
    } else if indexPath.section == 1 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath)
      
      cell.backgroundColor = .green
      cell.layer.cornerRadius = 32
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feed", for: indexPath)
        
      if indexPath.row == 0 {
        cell.backgroundColor = .brown
      } else if indexPath.row == 1 {
        cell.backgroundColor = .red
      } else if indexPath.row == 2 {
        cell.backgroundColor = .blue
      } else if indexPath.row == 3 {
        cell.backgroundColor = .magenta
      } else if indexPath.row == 4 {
        cell.backgroundColor = .orange
      }
      
      return cell
    }
  }
}
