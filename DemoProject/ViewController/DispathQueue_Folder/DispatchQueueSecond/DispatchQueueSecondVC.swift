//
//  DispatchQueueSecondVC.swift
//  DemoProject
//
//  Created by clavax on 06/01/23.
//

import Foundation
import UIKit
class DispatchQueueSecondVC:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // notifyDispatchGroup()
        syncWaitingGroup()
    }
    
    @IBAction func backButtom(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    
    }
    
}

//Dispatch Group

extension DispatchQueueSecondVC{
    func notifyDispatchGroup(){
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "com.clavax.app")
        let someQueue = DispatchQueue(label: "com.clvax2.app")
        
        queue.async(group: group){
            for item in 0...25{
                print("Queue:- Task one running--> \(item)")
            }
        }
        
        queue.async(group: group){
            for item in 0...15{
                print("Queue:- Task two running--> \(item)")
            }
        }
        
        someQueue.async(group: group){
            for item in 0...35{
                print("someQueue:- Task one running--> \(item)")
            }
        }
        group.notify(queue: DispatchQueue.main){
            print("All jobs have completed")
        }
        
    }
    
}

// Syncronize waiting

extension DispatchQueueSecondVC{
    
   func syncWaitingGroup(){
       
        let group = DispatchGroup()
       let queue = DispatchQueue.global(qos: .userInitiated)
       
       queue.async(group:group) {
           print("Start job 1")
           Thread.sleep(until: Date().addingTimeInterval(10))
           print("End job 1")

        }
       
       queue.async(group:group) {
           print("Start job 2")
           Thread.sleep(until: Date().addingTimeInterval(2))
           print("End job 2")

        }
       
       if group.wait(timeout: .now() + 5) == .timedOut{
           print("I got tired of waiting")
       }else{
           print("All the job have completed")
       }
       
    }
}
