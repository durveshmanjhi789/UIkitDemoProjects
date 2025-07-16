//
//  DispatchQueueVC.swift
//  DemoProject
//
//  Created by clavax on 05/01/23.
//

import Foundation
import UIKit
class DispatchQueueVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func backButtom(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    
    }
    
    @IBAction func dispatchFirstButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DispatchQueueFirstVC")as! DispatchQueueFirstVC
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func dispatchSecondButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DispatchQueueSecondVC")as! DispatchQueueSecondVC
        
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}

