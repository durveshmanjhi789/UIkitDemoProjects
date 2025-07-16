//
//  ProtocolDelegateVC.swift
//  DemoProject
//
//  Created by clavax on 05/12/22.
//

import Foundation
import UIKit

class ProtocolDelegateVC: UIViewController,dataPass {
    func addingNumber(Data: String) {
        data = Data
        print("Data--> \(Data)")
        selectedData.text = data
    }
   
    @IBOutlet weak var selectedData: UILabel!
    
    var data:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backbutton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ProtocolDelegate2VC")as! ProtocolDelegate2VC
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
        
    }
}
