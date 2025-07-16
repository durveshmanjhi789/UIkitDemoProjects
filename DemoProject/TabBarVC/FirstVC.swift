//
//  FirstVC.swift
//  DemoProject
//
//  Created by clavax on 07/12/22.
//

import Foundation
import UIKit

class FirstVC:UIViewController{
    
    @IBOutlet weak var myView: UIView!
    var tabbar:TabbarVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // removeChild()

        
    }
    
    @IBAction func nextButton(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourthVC")as! FourthVC
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}

extension UIViewController {
        
  func removeChild() {
    self.children.forEach {
      $0.willMove(toParent: nil)
      $0.view.removeFromSuperview()
      $0.removeFromParent()
    }
  }
}
