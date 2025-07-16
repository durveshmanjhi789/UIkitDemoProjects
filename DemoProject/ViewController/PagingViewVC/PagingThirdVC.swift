//
//  PagingThirdVC.swift
//  DemoProject
//
//  Created by clavax on 18/01/23.
//

import Foundation
import UIKit
class PagingThirdVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AboutButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)

    }
}
