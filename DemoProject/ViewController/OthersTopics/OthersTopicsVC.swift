//
//  OthersTopicsVC.swift
//  DemoProject
//
//  Created by clavax on 05/12/22.
//


import Foundation
import UIKit

class OthersTopicsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func protocolDelegateButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ProtocolDelegateVC")as! ProtocolDelegateVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ClosureButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ClosureVC")as! ClosureVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
