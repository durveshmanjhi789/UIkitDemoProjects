//
//  TabbarVC.swift
//  DemoProject
//
//  Created by clavax on 07/12/22.
//


import Foundation
import UIKit

class TabbarVC:UIViewController{
    
    @IBOutlet weak var frstIcon: UIImageView!
    @IBOutlet weak var secondIcon: UIImageView!
    @IBOutlet weak var thirdIcon: UIImageView!
    @IBOutlet var contentView: UIView!
    
   static var sharedTabbar = TabbarVC()
    var ParentVC:UIViewController!
    var PreviousVC:UIViewController!
    
    let viewControllers:[UIViewController]! = []
    
    var main:UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        firstView()
  
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
  
    
    func firstView() {
        frstIcon.isHidden = false
        secondIcon.isHidden = true
        thirdIcon.isHidden = true
        let firstVc = main.instantiateViewController(withIdentifier: "FirstVC")as! FirstVC
        let tabFirstnav = UINavigationController(rootViewController: firstVc)
        tabFirstnav.navigationItem.hidesBackButton = true
        firstVc.tabbar = self
        handleConstant(tabFirstnav)

        print("firstVc--> \(contentView.subviews.count)")

    }
    
    func handleConstant(_ controller:UIViewController){
        PreviousVC = controller
        addChild(controller)
        
        contentView.addSubview(controller.view)
        controller.didMove(toParent: self)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

    }
    
    func RemoveHandleConstant(_ controller:UIViewController){
        
        PreviousVC = controller
        contentView.willRemoveSubview(PreviousVC.view)
        PreviousVC.removeChild()
        PreviousVC.willMove(toParent: nil)
        PreviousVC.removeFromParent()
        PreviousVC.view.removeFromSuperview()
 
    }
    
    
    @IBAction func firstButton(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 1{
            
            frstIcon.isHidden = false
            secondIcon.isHidden = true
            thirdIcon.isHidden = true
            let firstVc = main.instantiateViewController(withIdentifier: "FirstVC")as! FirstVC
            let tabFirstnav = UINavigationController(rootViewController: firstVc)
           tabFirstnav.navigationItem.hidesBackButton = true
            firstVc.tabbar = self
            RemoveHandleConstant(PreviousVC)
            handleConstant(tabFirstnav)
            print("firstVc--> \(contentView.subviews.count)")

            
        }else if tag == 2{
            
            frstIcon.isHidden = true
            secondIcon.isHidden = false
            thirdIcon.isHidden = true
            let Secondvc = main.instantiateViewController(withIdentifier: "SecondVC")as! SecondVC
            
            let tabFirstnav = UINavigationController(rootViewController: Secondvc)
           // tabFirstnav.navigationItem.hidesBackButton = true
            tabFirstnav.navigationItem.hidesBackButton = true

            Secondvc.tabbar = self
            RemoveHandleConstant(PreviousVC)
            handleConstant(tabFirstnav)

            print("Secondvc--> \(contentView.subviews.count)")
        }else{
            
            frstIcon.isHidden = true
            secondIcon.isHidden = true
            thirdIcon.isHidden = false
            let Thirdvc = main.instantiateViewController(withIdentifier: "ThirdVC")as! ThirdVC
            let tabFirstnav = UINavigationController(rootViewController: Thirdvc)
            tabFirstnav.navigationItem.hidesBackButton = true

            Thirdvc.tabbar = self
            RemoveHandleConstant(PreviousVC)
            handleConstant(tabFirstnav)
        
            
            print("Thirdvc--> \(contentView.subviews.count)")

        }
      
    }
  
}

