//
//  PagingFirstVC.swift
//  DemoProject
//
//  Created by clavax on 18/01/23.

import Foundation
import UIKit
import LZViewPager

class PagingFirstVC:UIViewController,LZViewPagerDelegate,LZViewPagerDataSource{
      
    @IBOutlet weak var viewPager: LZViewPager!
    private var subControllers:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPagerProperty()
    }
    
    
    func viewPagerProperty(){
        viewPager.hostController = self
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "PagingSecondVC")as! PagingSecondVC
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "PagingThirdVC")as! PagingThirdVC
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "PagingFourthVC")as! PagingFourthVC
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "PagingFifthVC")as! PagingFifthVC
        
        vc1.title = "Home"
        vc2.title = "About"
        vc3.title = "Notification"
        vc4.title = "Profile"

        subControllers = [vc1,vc2,vc3,vc4]
        viewPager.reload()
        
        
    }
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .white
        
        return button
    }
    
    func backgroundColorForHeader() -> UIColor{
        return .black
    }

    
    func colorForIndicator(at: Int) -> UIColor{
        return .white
    }
   
}
