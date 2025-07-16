//
//  iCarouselVC2.swift
//  DemoProject
//  Created by clavax on 07/02/23.

import Foundation
import UIKit
import iCarousel

class iCarouselVC2:UIViewController, iCarouselDataSource{
    var carouselType:iCarouselType!
    
    @IBOutlet weak var myview: iCarousel!

    let imgList =  ["images-1","images-10","images-8","images-7","images-6","images-5","images-9","images-3","images-4","images-10"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouseltype(type: carouselType)
        
        view.addSubview(myview)
        myview.dataSource = self
        myview.autoscroll = -0.5

    }
    
    func carouseltype(type:iCarouselType){
        myview.type = type

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgList.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/1.5, height: 200))
                
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleToFill
        //imageView.image = UIImage(named: "images-\(index+1)")
        imageView.image = UIImage(named: imgList[index])

        return view
        
    }

    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
          // I am using sample array which contains an array of names,
         //  you  can either print the index alone ( from 0... up to the end of your array) or
         // you can print the name that the index is pointing to.

        // Let me know if you want the entire code.

           print(imgList[index])
      }

}
