//
//  ProtocolDelegate2VC.swift
//  DemoProject
//
//  Created by clavax on 05/12/22.
//

import Foundation
import UIKit

protocol dataPass:class{
    
    func addingNumber(Data:String)
}

class ProtocolDelegate2VC: UIViewController {
    
    weak var delegate:dataPass?
    
    @IBOutlet weak var protocolTableView: UITableView!
    
    var mytableList = ["durvesh","amar","nitin","shivam","adarsh","Abhisekh","mukul","vidya","amit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ProtocolDelegate2VC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mytableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.protocolTableView.dequeueReusableCell(withIdentifier: "ProtocolDelegate2Cell", for: indexPath)as! ProtocolDelegate2Cell
        cell.textData.text = mytableList[indexPath.row]
        
        return cell
        
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = mytableList[indexPath.row]
        self.delegate?.addingNumber(Data: value)
        self.dismiss(animated: true, completion: nil)
        
        }
}
