//
//  TextViewVC.swift
//  DemoProject
//  Created by clavax on 06/01/23.

import Foundation
import UIKit

class TextViewVC:UIViewController{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    var myString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Single Tapped
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapped(_:)))
        singleTap.numberOfTapsRequired = 1
        textView.addGestureRecognizer(singleTap)
        
        //Double Tapped
        let DoubleTap = UITapGestureRecognizer(target: self, action: #selector(DoubleTapped(_:)))
        DoubleTap.numberOfTapsRequired = 2
        textView.addGestureRecognizer(DoubleTap)
        
    }
    
    //single tapped Action---->
    @objc private final func singleTapped(_ tapGesture:UITapGestureRecognizer){
        
        let point = tapGesture.location(in: textView)
        if let detectedWord = getWordAtPosition(point){
            print("word--",detectedWord)
            
            let attributedString = NSMutableAttributedString.init(string: myString)
            let range = (myString as NSString).range(of: detectedWord)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: random(), range: range)
            textView.attributedText = attributedString
            textView.font = UIFont.preferredFont(forTextStyle: .body)
            textView.sizeToFit()
        }
        
    }
    
    //Double Tapped Action ----->
    
    @objc func DoubleTapped(_ tapGesture:UITapGestureRecognizer){
     
        guard textField.text != nil else { return }
        let point = tapGesture.location(in: textView)
        if let detectedWord = getWordAtPosition(point){
            
            textView.text += "\n\(detectedWord)"
            myString = textView.text
        }
    }
    
    
    func getWordAtPosition(_ point:CGPoint) -> String?{
        
        if let textPosition = textView.closestPosition(to: point){
            if let range = textView.tokenizer.rangeEnclosingPosition(textPosition, with: .word, inDirection: UITextDirection(rawValue: 1)){
                return textView.text(in: range)
            }
        }
        return nil
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func textAction(_ sender: UITextField) {
        self.textView.text = self.textField.text
        myString = textField.text!
        
    }
    
    //Random Color
    func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
