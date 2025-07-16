//
//  ICarouselVC.swift
//  DemoProject
//
//  Created by clavax on 07/02/23.
//

import Foundation
import UIKit
class ICarouselVC:UIViewController{
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func carouselStylebutton(_ sender: UIButton) {
        switch sender.tag{
            
        case 1:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .cylinder
            self.navigationController?.pushViewController(vc, animated: false)

        case 2:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .coverFlow
            self.navigationController?.pushViewController(vc, animated: false)

        case 3:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .invertedCylinder
            self.navigationController?.pushViewController(vc, animated: false)

        case 4:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .coverFlow2
            self.navigationController?.pushViewController(vc, animated: false)

        case 5:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .linear
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 6:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .rotary
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 7:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .wheel
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 8:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .invertedWheel
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 9:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .invertedRotary
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 10:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .invertedCylinder
            self.navigationController?.pushViewController(vc, animated: false)
            
        case 11:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .invertedTimeMachine
            self.navigationController?.pushViewController(vc, animated: false)
            
        default:
            let vc = self.storyboard?.instantiateViewController(identifier: "iCarouselVC2")as! iCarouselVC2
            vc.carouselType = .timeMachine
            self.navigationController?.pushViewController(vc, animated: false)

        }
                
    }
    
    
    
}
