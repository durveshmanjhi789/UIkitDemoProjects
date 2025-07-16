//
//  ScrollViewVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit

class ScrollViewVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func vackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
