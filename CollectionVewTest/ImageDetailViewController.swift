//
//  ImageDetailViewController.swift
//  CollectionVewTest
//
//  Created by Kinson Chow on 1/25/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//


import UIKit
import Social

class ImageDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageDetailView: UIImageView!
    
    @IBOutlet weak var imageDetailView3: UIImageView!
    
    @IBOutlet weak var imageDetailView2: UIImageView!
    
    var imageName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "💕❤️❤️❤️💕"
        
        let uiimage = UIImage(named: imageName!)

        if let name = imageName{
            if uiimage?.size == CGSizeMake(1204, 1804){
                imageDetailView.image = uiimage
            }else if uiimage?.size == CGSizeMake(1715, 2315){
                imageDetailView3.image = uiimage
            }else{
                imageDetailView2.image = uiimage
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareTapped(sender: AnyObject) {
        let uiimage = UIImage(named: imageName!)
        
        var controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        controller.setInitialText("我老公好靓仔啊！❤️😍")
        
        
        controller.addImage(uiimage)
        
        self.presentViewController(controller, animated: true, completion: nil )
    }

    
}
