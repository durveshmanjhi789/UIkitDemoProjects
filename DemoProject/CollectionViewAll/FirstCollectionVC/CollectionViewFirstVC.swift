//
//  CollectionViewFirstVC.swift
//  DemoProject
//
//  Created by clavax on 30/11/22.
//

import Foundation
import UIKit
import SKPhotoBrowser

class CollectionViewFirstVC:UIViewController{
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var collectionview:
        UICollectionView!
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var myPage: UIPageControl!
    
    var petsList = ["images-1","images-10","images-8","images-7","images-6","images-5","images-9","images-3","images-4","images-10"]
    
    var petsList2 = ["images-1","images-10","images-8","images-7","images-6"]
    var petsList3 = ["images-1","images-10","images-8","images-7","images-6","images-5","images-9","images-3","images-4","images-10"]

    var timer:Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPage.currentPage = 0
        myPage.numberOfPages = petsList2.count
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Slide), userInfo: nil, repeats: true)
       
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func Slide(){
        
        if counter < petsList2.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.secondCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            myPage.currentPage = counter
            counter += 1

        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.secondCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            myPage.currentPage = counter

        }
    
    }
}

extension CollectionViewFirstVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == firstCollectionView{
            return petsList3.count

        }else if collectionView == collectionview{

            return petsList.count

        }else{
            
            return petsList2.count

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == firstCollectionView{
            let cell = self.firstCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionCell", for: indexPath)as! FirstCollectionCell
            cell.myPetsPhotos.image = UIImage(named: petsList3[indexPath.item])
            cell.myPetsPhotos?.layer.cornerRadius = 40
            cell.myPetsPhotos?.layer.borderWidth = 2
            cell.myPetsPhotos.layer.borderColor = UIColor.link.cgColor

            return cell
        }else if collectionView == collectionview{
            let cell = self.collectionview.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
            cell.petsImage.image = UIImage(named: petsList[indexPath.item])
            cell.petsImage?.layer.cornerRadius = 12

            cell.deleteBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(deleteCellTapped(sender: )), for: .touchUpInside)
            
        
            
            return cell
        }else{
            
            let cell = self.secondCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath)as! SecondCell
            
            cell.imageSlide.image = UIImage(named: petsList2[indexPath.item])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == firstCollectionView{

            var images = [SKPhoto]()
            let photo = SKPhoto.photoWithImage(UIImage(named: petsList3[indexPath.item])!)// add some UIImage
            images.append(photo)

            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images)
            browser.initializePageIndex(0)
            present(browser, animated: true, completion: {})
        }else{
            
            var images = [SKPhoto]()
            let photo = SKPhoto.photoWithImage(UIImage(named: petsList[indexPath.item])!)// add some UIImage
            images.append(photo)
            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images)
            browser.initializePageIndex(0)
            present(browser, animated: true, completion: {})
           
        }
        
    }
    
    @objc func deleteCellTapped(sender:UIButton){

        
        let alert = UIAlertController(title: "", message: "Are You Sure Want to Delete", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: { _ in
            //Cancel Action
            print("hello")

        }))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
            
            //OKY Action
            self.petsList.remove(at: sender.tag)
               self.collectionview.reloadData()
               print("hi")
            
        }))
        self.present(alert, animated: true, completion: nil)

    }

    
}



extension CollectionViewFirstVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {


        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == firstCollectionView{

            return CGSize(width: collectionView.frame.size.width/4.0 - 6,
                          height: collectionView.frame.size.width/4.0 - 6)

        }else if collectionView == collectionview{

            return CGSize(width: collectionView.frame.size.width/2.0 - 10,
                          height: collectionView.frame.size.width/2.0 - 10)
        }else{

            return CGSize(width: collectionView.frame.size.width,
                          height: collectionView.frame.size.height)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}
