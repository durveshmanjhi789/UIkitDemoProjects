//
//  TableViewFirstVC.swift
//  DemoProject
//  Created by clavax on 30/11/22.

import Foundation
import UIKit

class CarBrand{
    var brandName:String?
    var modelName:[String]?
    init(brandName:String,modelname:[String]) {
        self.brandName = brandName
        self.modelName = modelname
    }
}

class TableViewFirstVC:UIViewController,passingDataBack{

    func updateRow(UpdateCarName: String?, SectionNumber: Int?, RowNumber: Int?) {
        
        self.carBrand[SectionNumber ?? 0].modelName?[RowNumber ?? 0] = UpdateCarName ?? ""
        tableView.reloadData()
      
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var carBrand = [CarBrand]()
    var rowNumber = 0
    var sectionNumber = 0
    
    var refreshControl = UIRefreshControl()
    var offset = 1
    var isrefresh = false
    
    
    var selectedData:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        
        carBrand.append(CarBrand.init(brandName: "Skoda", modelname: ["Skoda Rapid","Skoda Kushaq","Skoda Octavia","Skoda Superb"]))
        
        carBrand.append(CarBrand.init(brandName: "Maruti Suzuki", modelname: ["Maruti Dzire","Maruti Baleno","Maruti Vitara Brezza","Maruti Ertiga","Maruti Dzire","Maruti S-Cross ","Maruti Ciaz",]))
       
        carBrand.append(CarBrand.init(brandName: "Hyundai", modelname: ["Hyundai Santro","Hyundai Kona Electric","Hyundai Tucson","Hyundai Elantra","Hyundai Alcazar","Hyundai Creta","Hyundai i20 N Line",]))
       
        carBrand.append(CarBrand.init(brandName: "Mahindra & Mahindra", modelname: ["Mahindra Alturas G4","Mahindra Thar","Mahindra Scorpio","Mahindra XUV700","Mahindra Marazzo","Mahindra eVerito (Electric)","Mahindra Bolero Neo",]))
        
    }

    @objc func refresh(_ sender: AnyObject) {
        offset = 1
        isrefresh = true
        print("refres....")
        refreshControl.endRefreshing()
       
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    
    }
    
}

extension TableViewFirstVC:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return carBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carBrand[section].modelName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        rowNumber = indexPath.row
        sectionNumber = indexPath.section
        cell.TitleName.text = carBrand[indexPath.section].modelName?[indexPath.row]
        return cell
    }
    

    //Swipe Action -->

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Insert Data in Row--->
        let Add = UIContextualAction(style: .normal, title: "Insert"){ _, _, _ in
            self.selectedData = self.carBrand[indexPath.section].modelName?[indexPath.row]
                                     
                tableView.beginUpdates()
                let VC2 = UIAlertController(title: "Enter Model Name", message: nil, preferredStyle: .alert)
                VC2.addTextField()
                
                let SubmitAction = UIAlertAction(title: "Submit", style: .destructive, handler: { _ in
                  //  let myIndex:IndexPath = IndexPath(row: (self.carBrand[indexPath.section].modelName![indexPath.row].count ), section: self.carBrand[indexPath.section].brandName!.count)
                    
                    let textObj = VC2.textFields![0]
                    self.carBrand[indexPath.section].modelName?.insert(textObj.text!, at: indexPath.row)
                    self.tableView.insertRows(at: [indexPath], with: .fade)
                    self.tableView.endUpdates()
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                    print("textObj--> \(String(describing: self.carBrand[indexPath.section].modelName))")
                })
            VC2.addAction(SubmitAction)
            self.present(VC2, animated: true, completion: nil)
            
        }
        
        // Update Data in Row--->

        let update = UIContextualAction(style: .normal, title: "Update"){ _, _, _ in

            self.selectedData = self.carBrand[indexPath.section].modelName?[indexPath.row]            
         
            let VC = self.storyboard?.instantiateViewController(identifier: "TableViewSecondVC")as! TableViewSecondVC
            
            VC.delegate = self
            VC.dataPass = self.selectedData
            VC.SectionNumber = indexPath.section
            VC.RowNumber = indexPath.row
            self.present(VC, animated: true, completion:nil)
            
        }

        update.backgroundColor = .black
        Add.backgroundColor = .systemGreen

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [Add,update])
        return swipeConfiguration

    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    //Delete Row in table view-->
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .insert{
            
            tableView.beginUpdates()
            let VC = UIAlertController(title: "Enter Model Name", message: nil, preferredStyle: .alert)
            VC.addTextField()
            
            let SubmitAction = UIAlertAction(title: "Submit", style: .destructive, handler: { _ in
                
                let textObj = VC.textFields![0]
                self.carBrand[indexPath.section].modelName?.insert(textObj.text!, at: indexPath.row)
                self.tableView.insertRows(at: [indexPath], with: .fade)
                
            })
            VC.addAction(SubmitAction)
            present(VC, animated: true, completion: nil)
        }
        
        if editingStyle == .delete{
            carBrand[indexPath.section].modelName?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        view.backgroundColor = .gray
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.frame.width - 25, height: 40))
        lbl.text = carBrand[section].brandName
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
