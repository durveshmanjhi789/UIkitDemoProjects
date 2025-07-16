//
//  ClosureVC2.swift
//  DemoProject
//
//  Created by clavax on 05/12/22.
//

import Foundation
import UIKit
class ClosureVC2: UIViewController {
    
    @IBOutlet weak var usernametext: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    typealias completionHandler = ([String:Any]) -> Void
    var completion:completionHandler?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savebutton(_ sender: Any) {
        
        guard let username = usernametext.text else {return}
        guard let password = passwordText.text else{return}
        
        let dict = ["name":username,"pass":password]
        guard let checkData = completion else {return }
        checkData(dict)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
