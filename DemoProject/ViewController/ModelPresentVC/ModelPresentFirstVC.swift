//
//  ModelPresentFirstVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit

class ModelPresentFirstVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func buttonTaped(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ModelPresentation(style: .automatic, ModalStyle: .crossDissolve)
        case 2:
            ModelPresentation(style: .custom, ModalStyle: .coverVertical)
        case 3:
            ModelPresentation(style: .formSheet, ModalStyle: .coverVertical)
        case 4:
            ModelPresentation(style: .pageSheet, ModalStyle: .crossDissolve)
        case 5:
            ModelPresentation(style: .popover, ModalStyle: .crossDissolve)
        case 6:
            ModelPresentation(style: .currentContext, ModalStyle: .flipHorizontal)
        case 7:
            ModelPresentation(style: .overCurrentContext, ModalStyle: .crossDissolve)
        case 8:
            ModelPresentation(style: .fullScreen, ModalStyle: .crossDissolve)
        case 9:
            ModelPresentation(style: .overFullScreen, ModalStyle: .crossDissolve)
        default:
            ModelPresentation(style: .none, ModalStyle: .crossDissolve)
        }
        
    }
    
    
    func ModelPresentation(style: UIModalPresentationStyle,ModalStyle:UIModalTransitionStyle) {
        guard let VC = self.storyboard?.instantiateViewController(identifier: "ModelPresentSecondVC") as? ModelPresentSecondVC else {
            
            return }
        
        VC.modalPresentationStyle = style
        VC.modalTransitionStyle = ModalStyle
        self.present(VC, animated: true, completion: nil)
        
    }
        
}
