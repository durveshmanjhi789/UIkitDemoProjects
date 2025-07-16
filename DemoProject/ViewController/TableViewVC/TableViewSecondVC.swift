//
//  TableViewSecondVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit

protocol passingDataBack {
    func updateRow(UpdateCarName:String?,SectionNumber:Int?,RowNumber:Int?)
}

class TableViewSecondVC:UIViewController{
    
    var delegate:passingDataBack!
    var dataPass:String?
    var RowNumber = 0
    var SectionNumber = 0

    @IBOutlet weak var carText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carText.text = dataPass
  

    }
   
    @IBAction func addData(_ sender: Any) {
        
        let newTextData = carText.text!
        print("SectionNumber--> \(SectionNumber)")
        print("RowNumber--> \(RowNumber)")

        delegate.updateRow(UpdateCarName: newTextData, SectionNumber: SectionNumber, RowNumber: RowNumber)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
