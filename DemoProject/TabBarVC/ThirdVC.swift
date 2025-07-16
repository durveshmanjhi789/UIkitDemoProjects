//
//  ThirdVC.swift
//  DemoProject
//
//  Created by clavax on 07/12/22.
//


import Foundation
import UIKit
class ThirdVC:UIViewController{
    var tabbar:TabbarVC!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourthVC")as! FourthVC
        self.navigationController?.pushViewController(vc, animated: false)

    }
}
