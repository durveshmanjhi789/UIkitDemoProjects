//
//  HighOrderFunctionVC.swift
//  DemoProject
//
//  Created by clavax on 17/01/23.
//

import Foundation
import UIKit
class HighOrderFunctionVC:UIViewController{
    
    let map_List = [1,2,3,4,5,6]
    let CompactMap_List = [1,nil,2,nil,3,nil,4,nil,5,nil,6]
    let FlatMap_List = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18]]

    override func viewDidLoad() {
        super.viewDidLoad()
        Map()
        CompactMap()
        Flatmap()
    }
    //Map example use for print normal list
    func Map(){
        
        let mapL = map_List.map{$0 * 5}
        print("Map -> ", mapL)
    }
    //compact map example use for remove optional and nil from the list
    
    func CompactMap(){
        let cMapList = CompactMap_List.compactMap{$0}.map{$0 * 5}
        print("CompactMap -> ", cMapList)
    }
    
    //Flatmap example use for convert single arry from multi array collection

    func Flatmap(){
        
        let FlatMapL = FlatMap_List.flatMap{$0}
        print("Flatmap -> ", FlatMapL)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)

    }
    
}
