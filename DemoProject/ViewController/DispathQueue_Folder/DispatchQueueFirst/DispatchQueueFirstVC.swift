//
//  DispatchQueueFirstVC.swift
//  DemoProject
//
//  Created by clavax on 06/01/23.
//

import Foundation
import UIKit
class DispatchQueueFirstVC:UIViewController{
    override func viewDidLoad() {
        //Serial_SyncEx()
        //Serial_AsyncEx()
        //Concurrent_SyncEx()
        Concurrent_AsyncEx()
    }
    
    
    //Thread       Task
    //   |           |
    //Serial     + Sync - ORDER
    //Serial     + Async - ORDER
    //Concurrent + Sync - ORDER
    //Concurrent + Async - UNORDER
    
    //----------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    //Serial + Sync - ORDER---->
    
    func Serial_SyncEx(){
        let myQueue = DispatchQueue(label: "demo.DemoProject")
        print("Serial + Sync - ORDER----->")

        //One Thread
        myQueue.sync {
            print("Task 1 started")
            
            for item in 0...5{
                print("\(item) Task-1 times is -> \(item * 5)")
            }
            print("Task 1 finished")
        }
        
        //Second Thread
        myQueue.sync {
            print("Task 2 started")
            print("Task 2 finished")

        }
        
    }
    
    //Serial + Async - ORDER ---->

    func Serial_AsyncEx(){
        let myQueue = DispatchQueue(label: "durvesh kumar manjhi")
        print("Serial + Async - ORDER ----->")
        //One Thread
        myQueue.async {
            print("Task 1 started")
            
            for item in 0...10{
                print("\(item) Task-1 times is \(item * 5)")
            }
            print("Task 1 finished")
        }
        
        //Second Thread
        myQueue.async {
            print("Task 2 started")
            print("Task 2 finished")

        }
        
    }
    
    //Concurrent + Sync - ORDER----------->
    
    func Concurrent_SyncEx(){
        let myQueue = DispatchQueue(label: "durvesh kumar manjhi",attributes: .concurrent)
        print("Concurrent + Sync - ORDER ---->")
        //One Thread
        myQueue.sync {
            print("Task 1 started")
            
            for item in 0...10{
                print("\(item) Task-1 times is \(item * 5)")
            }
            print("Task 1 finished")
        }
        
        //Second Thread
        myQueue.sync {
            print("Task 2 started")
            print("Task 2 finished")

        }
        
    }
    
    //Concurrent + Async - UNORDER ------------->

    func Concurrent_AsyncEx(){
        let myQueue = DispatchQueue(label: "durvesh kumar manjhi",attributes: .concurrent)
        print("Concurrent + Async - UNORDER ---->")
        //One Thread
        myQueue.async {
            print("Task 1 started")
            
            for item in 0...5{
                print("\(item) Task-1 times is \(item * 5)")
            }
            print("Task 1 finished")
        }
        
        //Second Thread
        myQueue.async {
            print("Task 2 started")
            
            for item in 0...10{
                print("\(item) Task-2 times is \(item * 5)")
            }
            print("Task 2 finished")

        }
        
    }
    
    
    @IBAction func backButtom(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    
    }
    
}
