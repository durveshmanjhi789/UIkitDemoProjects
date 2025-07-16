//
//  ObjectRecognizerVC.swift
//  DemoProject
//
//  Created by clavax on 26/12/22.

import Foundation
import UIKit
import AVKit
import Vision

class ObjectRecognizerVC:UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagename: UILabel!
    
    let model = MobileNetV2()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapped(sender:)))
        TapGesture.numberOfTapsRequired = 1
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(TapGesture)

    }
    
    @objc func didTapped(sender:UIButton){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: false, completion: nil)
                
    }
    
    private func performImageClassification(image: UIImage?){
       guard let buffer = image?.resize(size: CGSize(width: 224, height: 224))?
                          .getCVPixelBuffer() else {
                      return
                  }
        let output = try? model.prediction(image: buffer)
        imagename.text = output?.classLabel ?? ""
        print("data1--> \(output?.classLabel ?? "")")
        
    }
    
//    private func analyzeImage(image:UIImage){
//        guard let buffer = image.resize(size: CGSize(width: 224, height: 224))?.getCVPixelBuffer() else{
//            return
//
//        }
//
//        do{
//            let config = MLModelConfiguration()
//            let model = try GoogLeNetPlaces(configuration: config)
//            let input = GoogLeNetPlacesInput(sceneImage: buffer)
//
//            let output = try model.prediction(input: input)
//            let text = output.sceneLabel
//            imagename.text = text
//
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//

    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image1 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        image.image = image1
        performImageClassification(image: image1)
    
    
    }
    

    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)

    }
    
    
}
