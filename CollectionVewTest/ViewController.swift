//
//  ViewController.swift
//  CollectionVewTest
//
//  Created by Kinson Chow on 1/24/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//

import UIKit

var imagesArr : [ImagesModel] = []


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var cv: UICollectionView!
    
    var imageObj:ImagesModel? = nil
    
    var imageNameForImageDetail:String = ""
    
    var vc = ImageDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Seashore"
        
        cv.dataSource = self
        cv.delegate = self

        for var i in 1...69{
            imagesArr.append(ImagesModel(id: i, image: "seashore_\(i)"))
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SeashoreSegue1" || segue.identifier == "SeashoreSegue2"{
            //来源页指向目标页
            self.vc = segue.destinationViewController as! ImageDetailViewController
           
        }
        
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        self.imageObj = imagesArr[indexPath.row]
        
        let size1 = CGSizeMake(1204, 1804)
        
        let cell = self.cv.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let cell2 = self.cv.dequeueReusableCellWithReuseIdentifier("cell2", forIndexPath: indexPath)
    
        let image = cell.viewWithTag(77) as! UIImageView
        
        let image2 = cell2.viewWithTag(077) as! UIImageView
        
        if UIImage(named: imageObj!.image)?.size == size1{
            image.image = UIImage(named: imageObj!.image)
            return cell
        }else{
            image2.image = UIImage(named: imageObj!.image)
            return cell2
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.imageObj = imagesArr[indexPath.row]
        
        if UIImage(named: imageObj!.image)?.size == CGSizeMake(1204, 1804){
            return CGSizeMake(110, 196)
        }else{
            return CGSizeMake(196, 110)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.imageObj = imagesArr[indexPath.row]
        self.imageNameForImageDetail = self.imageObj!.image
        self.vc.imageName = self.imageNameForImageDetail

        
    }
    
    
}

