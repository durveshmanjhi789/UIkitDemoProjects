//
//  File.swift
//  DemoProject
//
//  Created by clavax on 05/12/22.
//

import Foundation
import UIKit
class ClosureVC: UIViewController {
    
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var pass: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ClosureVC2")as! ClosureVC2
        vc.completion = { dict in
            self.username.text = dict["name"] as? String
            self.pass.text = dict["pass"] as? String
            
        }
        self.navigationController?.pushViewController(vc, animated: true)    }
    
}
