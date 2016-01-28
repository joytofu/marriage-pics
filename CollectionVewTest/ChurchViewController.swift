//
//  ChurchViewController.swift
//  CollectionVewTest
//
//  Created by Kinson Chow on 1/25/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//

import UIKit

var churchImagesArr : [ImagesModel] = []

class ChurchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var churchCv: UICollectionView!
    
    var imageObj:ImagesModel? = nil
    
    var imageNameForImageDetail:String = ""
    
    var vc = ImageDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Church"
        
        churchCv.dataSource = self
        churchCv.delegate = self
        
        for i in 1...33{
            churchImagesArr.append(ImagesModel(id: i, image: "church_\(i)"))
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "churchSegue1" || segue.identifier == "churchSegue2"{
            //来源页指向目标页
            self.vc = segue.destinationViewController as! ImageDetailViewController
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return churchImagesArr.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        self.imageObj = churchImagesArr[indexPath.row]
        
        let size1 = CGSizeMake(1204, 1804)
        
        let cell = self.churchCv.dequeueReusableCellWithReuseIdentifier("churchCell", forIndexPath: indexPath)
        let cell2 = self.churchCv.dequeueReusableCellWithReuseIdentifier("churchCell2", forIndexPath: indexPath)
        
        let image = cell.viewWithTag(74) as! UIImageView
        
        let image2 = cell2.viewWithTag(740) as! UIImageView
        
        if UIImage(named: imageObj!.image)?.size == size1{
            image.image = UIImage(named: imageObj!.image)
            return cell
        }else{
            image2.image = UIImage(named: imageObj!.image)
            return cell2
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.imageObj = churchImagesArr[indexPath.row]
        
        if UIImage(named: imageObj!.image)?.size == CGSizeMake(1204, 1804){
            return CGSizeMake(110, 196)
        }else{
            return CGSizeMake(196, 110)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.imageObj = churchImagesArr[indexPath.row]
        self.imageNameForImageDetail = self.imageObj!.image
        self.vc.imageName = self.imageNameForImageDetail
        
    }


    
    

    
}
