//
//  TableViewFirstVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit

class TableViewFirstVC:UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var myList = ["Durvesh","Areef","Mukul","Sushil","Adarsh","Harsh","Shivam","Amar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TableViewFirstVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        cell.TitleName.text = myList[indexPath.row]
        return cell
    }
    
}

extension TableViewFirstVC:UITableViewDelegate{
    
}

