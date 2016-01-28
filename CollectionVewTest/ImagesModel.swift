//
//  ImagesModel.swift
//  CollectionVewTest
//
//  Created by Kinson Chow on 1/24/16.
//  Copyright © 2016 Kinson Chow. All rights reserved.
//

import Foundation
class ImagesModel: NSObject{
    var id:Int
    var image:String
    
    init(id:Int,image:String){
       self.id = id
       self.image = image
    }
}
