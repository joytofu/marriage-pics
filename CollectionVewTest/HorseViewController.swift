//
//  SeashoreViewController.swift
//  CollectionVewTest
//
//  Created by Kinson Chow on 1/25/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//

import UIKit

var horseImagesArr : [ImagesModel] = []

class HorseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var horseCv: UICollectionView!
    
    var imageObj:ImagesModel? = nil
    
    var imageNameForImageDetail:String = ""
    
    var vc = ImageDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Horse"
        
        horseCv.dataSource = self
        horseCv.delegate = self
        
        for i in 1...24 {
            horseImagesArr.append(ImagesModel(id: i, image: "horse_\(i)"))
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "horseSegue1" || segue.identifier == "horseSegue2" {
            //来源页指向目标页
            self.vc = segue.destinationViewController as! ImageDetailViewController
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horseImagesArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        self.imageObj = horseImagesArr[indexPath.row]
        
        let size1 = CGSizeMake(1204, 1804)
        
        let cell = self.horseCv.dequeueReusableCellWithReuseIdentifier("horseCell", forIndexPath: indexPath)
        let cell2 = self.horseCv.dequeueReusableCellWithReuseIdentifier("horseCell2", forIndexPath: indexPath)
        
        let image = cell.viewWithTag(75) as! UIImageView
        
        let image2 = cell2.viewWithTag(750) as! UIImageView
        
        if UIImage(named: imageObj!.image)?.size == size1{
            image.image = UIImage(named: imageObj!.image)
            return cell
        }else{
            image2.image = UIImage(named: imageObj!.image)
            return cell2
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.imageObj = horseImagesArr[indexPath.row]
        
        if UIImage(named: imageObj!.image)?.size == CGSizeMake(1204, 1804){
            return CGSizeMake(110, 196)
        }else if UIImage(named: imageObj!.image)?.size == CGSizeMake(1715, 2315){
            return CGSizeMake(141, 190)
        }else{
            return CGSizeMake(196, 110)
        }
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.imageObj = horseImagesArr[indexPath.row]
        self.imageNameForImageDetail = self.imageObj!.image
        self.vc.imageName = self.imageNameForImageDetail
        
    }
    
    

    
}
