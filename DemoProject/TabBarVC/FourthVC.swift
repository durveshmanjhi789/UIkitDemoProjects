//
//  FourthVC.swift
//  DemoProject
//
//  Created by clavax on 12/12/22.
//


import Foundation
import UIKit

class FourthVC:UIViewController{

    var tabbar:TabbarVC!
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   removeChild()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")as! SecondVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

