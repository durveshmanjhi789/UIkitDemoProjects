//
//  PagingSecondVC.swift
//  DemoProject
//
//  Created by clavax on 18/01/23.
//

import Foundation
import UIKit

class PagingSecondVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func HomeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)

    }
}
