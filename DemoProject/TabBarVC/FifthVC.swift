//
//  FifthVC.swift
//  DemoProject
//
//  Created by clavax on 13/12/22.
//

import Foundation
import UIKit
class FifthVC:UIViewController{
    
    var tabbar:TabbarVC!

    @IBOutlet weak var fifthTableview: UITableView!
    var listdatat = ["durvesh","mohit","amar","mukul","amit"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fifthbutton(_ sender: Any) {
        
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC")as! FirstVC
        
        vc.tabbar = tabbar
        tabbar.handleConstant(vc)
    }
    
    @IBAction func backButton(_ sender: Any) {
        
      self.navigationController?.popViewController(animated: true)
        
    }
}

extension FifthVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listdatat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.fifthTableview.dequeueReusableCell(withIdentifier: "FifthCell", for: indexPath)as! FifthCell
        cell.name.text = listdatat[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC")as! FirstVC
        self.navigationController?.pushViewController(vc, animated: false)
        
  }
    
    
}
