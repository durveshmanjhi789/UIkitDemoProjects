//
//  CollectionLayoutVC.swift
//  DemoProject
//  Created by clavax on 16/01/23.

import Foundation
import UIKit

class CollectionLayoutVC:UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let images: [UIImage] = Array(1 ... 20).map { UIImage(named: String($0))! }
        
override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.collectionViewLayout = createLayout()
}

private func createLayout() -> UICollectionViewCompositionalLayout {
    let item = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
    
    let fullItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 1)
    
    let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.2), height: .fractionalHeight(1), item: fullItem, count: 2)
    
    let verticalGroup2 = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.2), height: .fractionalHeight(1), item: fullItem, count: 2)

    let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1.1), height: .fractionalHeight(1), items: [item, verticalGroup,verticalGroup2])
    
    let mainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.2), items: [horizontalGroup])
    
    let section = NSCollectionLayoutSection(group: mainGroup)
    
    // return
    return UICollectionViewCompositionalLayout(section: section)
}
    
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}

extension CollectionLayoutVC: UICollectionViewDelegate, UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
    cell.setup(image: images[indexPath.row])
    return cell
}
}

class MyCollectionViewCell: UICollectionViewCell {
@IBOutlet weak var cellImageView: UIImageView!

func setup(image: UIImage) {
    cellImageView.image = image
}
}
