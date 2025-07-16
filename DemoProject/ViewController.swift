//
//  ViewController.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tableButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TableViewFirstVC")as! TableViewFirstVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
   
    
    @IBAction func collectionButton(_ sender: Any) {
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "AllCollectionViewVC")as! AllCollectionViewVC
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    
    @IBAction func scrollButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ScrollViewVC")as! ScrollViewVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func ModelPresentButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ModelPresentFirstVC")as! ModelPresentFirstVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func OthersButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "OthersTopicsVC")as! OthersTopicsVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tabbarButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "TabbarVC")as! TabbarVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func RecognizerButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DispatchQueueVC")as! DispatchQueueVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func objectRecognizButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ObjectRecognizerVC")as! ObjectRecognizerVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func textviewButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TextViewVC")as! TextViewVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
  
    
    @IBAction func HighOrderFunction_Button(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "HighOrderFunctionVC")as! HighOrderFunctionVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func PagingView_Button(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "PagingFirstVC")as! PagingFirstVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    @IBAction func GoogleAdsButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "BannerAdsVC")as! BannerAdsVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

