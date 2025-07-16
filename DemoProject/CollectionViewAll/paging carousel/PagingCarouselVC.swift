//
//  PagingCarouselVC.swift
//  DemoProject
//
//  Created by clavax on 07/02/23.
//

import Foundation
import UIKit
import HSCycleGalleryView

class PagingCarouselVC:UIViewController, HSCycleGalleryViewDelegate{

    
    @IBOutlet weak var pagerController: UIView!
    let pager = HSCycleGalleryView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    
    let dogImg = ["images-2","images-3","images-4","images-5","images-6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pager.register(cellClass: PagerCell.self, forCellReuseIdentifier: "PagerCell")
        pager.delegate = self
        pagerController.addSubview(pager)
        pager.reloadData()
        
    }
    
    
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: HSCycleGalleryView) -> Int {
        3
    }
    
    func cycleGalleryView(_ cycleGalleryView: HSCycleGalleryView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: "PagerCell", for: IndexPath(item: index, section: 0)) as! PagerCell
        //cell.imageView.image = UIImage(named: dogImg[index])
        
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    
}
