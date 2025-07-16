//
//  AllCollectionViewVC.swift
//  DemoProject
//
//  Created by clavax on 07/02/23.

import Foundation
import UIKit

class AllCollectionViewVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func firstCVButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CollectionViewFirstVC")as! CollectionViewFirstVC
                
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func secondCVButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CollectionLayoutVC")as! CollectionLayoutVC
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func PagingCarouselButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "PagingCarouselVC")as! PagingCarouselVC
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func ICarouselButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ICarouselVC")as! ICarouselVC
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
