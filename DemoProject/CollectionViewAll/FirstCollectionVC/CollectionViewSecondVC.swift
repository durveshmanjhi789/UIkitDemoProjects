//
//  CollectionViewSecondVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit

class CollectionViewSecondVC: UIViewController {
    
    @IBOutlet weak var petsImg: UIImageView!
    
    @IBOutlet weak var blurView: UIView!
    
    var petImage:UIImage! = UIImage(named: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petsImg.image = petImage
        
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurredView.frame = self.view.bounds
        blurView.addSubview(blurredView)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}

extension UIImageView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
